import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class LanguageLocalizer {
  static final LanguageLocalizer _instance = LanguageLocalizer._internal();
  factory LanguageLocalizer() => _instance;
  LanguageLocalizer._internal();

  final Map<String, String> _cache = {};
  
  String get _apiKey => dotenv.env['AZURE_SPEECH_KEY'] ?? '';
  String get _region => dotenv.env['AZURE_SPEECH_REGION'] ?? 'eastus';

  /// Translates text using Azure Translator API if language is not English.
  /// Returns original text if language is English or if translation fails.
  Future<String> localize(String text, String targetLanguage) async {
    if (text.isEmpty) return text;
    
    // Normalize language code
    String langCode = 'en';
    if (targetLanguage.toLowerCase().contains('hindi')) langCode = 'hi';
    else if (targetLanguage.toLowerCase().contains('kannada')) langCode = 'kn';
    else if (targetLanguage.toLowerCase() == 'hi') langCode = 'hi';
    else if (targetLanguage.toLowerCase() == 'kn') langCode = 'kn';

    if (langCode == 'en') return text;

    // Check cache
    final cacheKey = '${text.hashCode}_$langCode';
    if (_cache.containsKey(cacheKey)) {
      return _cache[cacheKey]!;
    }

    try {
      final url = Uri.parse('https://api.cognitive.microsofttranslator.com/translate?api-version=3.0&to=$langCode');
      
      final response = await http.post(
        url,
        headers: {
          'Ocp-Apim-Subscription-Key': _apiKey,
          'Ocp-Apim-Subscription-Region': _region,
          'Content-Type': 'application/json',
        },
        body: jsonEncode([{'Text': text}]),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        if (data.isNotEmpty && data[0]['translations'] != null) {
          final translatedText = data[0]['translations'][0]['text'] as String;
          
          // Apply local formatting post-processing
          final formatted = _applyLocalFormatting(translatedText, langCode);
          
          _cache[cacheKey] = formatted;
          return formatted;
        }
      } else {
        print('⚠️ Azure Translation Error: ${response.body}');
      }
    } catch (e) {
      print('❌ Translation Exception: $e');
    }

    // Fallback to original text if translation fails
    return text;
  }

  String _applyLocalFormatting(String text, String langCode) {
    String processed = text;

    // Common replacements
    processed = processed.replaceAll('kg/ha', ' kg per hectare ');
    processed = processed.replaceAll('q/ha', ' quintals per hectare ');
    
    if (langCode == 'hi') {
      processed = processed.replaceAll('₹', ' रूपये ');
    } else if (langCode == 'kn') {
      processed = processed.replaceAll('₹', ' ರೂಪಾಯಿ ');
    } else {
      processed = processed.replaceAll('₹', ' rupees ');
    }

    // Add pauses for TTS/Readability (Visual pauses using punctuation)
    // Azure TTS might handle SSML, but for UI display we keep it valid text.
    // Replace colon with period for better pauses if needed, or keep as is.
    // Here we focus on text replacements requested.
    
    return processed;
  }
}

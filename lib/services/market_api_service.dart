import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/market_price.dart';

class MarketApiService {
  static const String _baseUrl = 'https://api.data.gov.in/resource/9ef84268-d588-465a-a308-a864a43d0070';
  static const String _apiKey = '579b464db66ec23bdd000001cdd3946e44ce4aad7209ff7b23ac571b';

  Future<List<MarketPrice>> fetchMarketPrices({String? state, String? district}) async {
    try {
      // Try fetching with specific district first
      List<MarketPrice> prices = await _fetchFromApi(state: state, district: district);
      
      // If no data found for district, try fetching for the whole state
      if (prices.isEmpty && district != null && state != null) {
        prices = await _fetchFromApi(state: state);
      }

      // If still empty, return a default fallback list or empty list
      if (prices.isEmpty) {
        // Fallback to empty list, UI will handle "No prices available"
        return [];
      }
      
      return prices;
    } catch (e) {
      print('Error fetching market prices: $e');
      return [];
    }
  }

  Future<List<MarketPrice>> _fetchFromApi({String? state, String? district}) async {
    try {
      final queryParams = {
        'api-key': _apiKey,
        'format': 'json',
        'limit': '100',
      };

      if (state != null && state.isNotEmpty) {
        queryParams['filters[state]'] = state;
      }
      if (district != null && district.isNotEmpty) {
        queryParams['filters[district]'] = district;
      }

      final uri = Uri.parse(_baseUrl).replace(queryParameters: queryParams);
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> records = data['records'] ?? [];
        return records.map((json) => MarketPrice.fromJson(json)).toList();
      } else {
        print('API Error: ${response.statusCode} ${response.body}');
        return [];
      }
    } catch (e) {
      print('Network Error: $e');
      return [];
    }
  }
}


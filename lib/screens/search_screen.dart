import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../theme/app_theme.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, this.initialQuery});

  final String? initialQuery;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  String _query = '';

  @override
  void initState() {
    super.initState();
    if (widget.initialQuery != null) {
      _controller.text = widget.initialQuery!;
      _query = widget.initialQuery!;
    }
  }

  // Map of searchable features to their routes and categories
  final Map<String, Map<String, String>> _featureMap = {
    // Features
    'crop recommendation': {'route': '/crop-rec', 'category': 'Feature', 'icon': 'seed'},
    'crop advisor': {'route': '/crop-rec', 'category': 'Feature', 'icon': 'seed'},
    'pest detection': {'route': '/pest', 'category': 'Feature', 'icon': 'bug'},
    'disease scanner': {'route': '/pest', 'category': 'Feature', 'icon': 'bug'},
    'market prices': {'route': '/market', 'category': 'Feature', 'icon': 'indian-rupee'},
    'weather': {'route': '/weather', 'category': 'Feature', 'icon': 'cloud'},
    'soil test': {'route': '/soil', 'category': 'Feature', 'icon': 'layers'},
    'ai chat': {'route': '/ai-chat', 'category': 'Feature', 'icon': 'message-circle'},
    'chatbot': {'route': '/ai-chat', 'category': 'Feature', 'icon': 'message-circle'},
    'community': {'route': '/community', 'category': 'Feature', 'icon': 'users'},
    'profile': {'route': '/profile', 'category': 'Profile', 'icon': 'user'},
    'settings': {'route': '/settings', 'category': 'Settings', 'icon': 'settings'},
    'finance': {'route': '/finance', 'category': 'Feature', 'icon': 'wallet'},
    'videos': {'route': '/videos', 'category': 'Feature', 'icon': 'video'},
    
    // Crops (all navigate to crop recommendation)
    'wheat': {'route': '/crop-rec', 'category': 'Crop', 'icon': 'wheat'},
    'paddy': {'route': '/crop-rec', 'category': 'Crop', 'icon': 'wheat'},
    'rice': {'route': '/crop-rec', 'category': 'Crop', 'icon': 'wheat'},
    'maize': {'route': '/crop-rec', 'category': 'Crop', 'icon': 'wheat'},
    'cotton': {'route': '/crop-rec', 'category': 'Crop', 'icon': 'wheat'},
    'sugarcane': {'route': '/crop-rec', 'category': 'Crop', 'icon': 'wheat'},
    'tomato': {'route': '/crop-rec', 'category': 'Crop', 'icon': 'apple'},
    'potato': {'route': '/crop-rec', 'category': 'Crop', 'icon': 'apple'},
    'onion': {'route': '/crop-rec', 'category': 'Crop', 'icon': 'apple'},
    
    // Pests/Diseases (all navigate to pest detection)
    'leaf blight': {'route': '/pest', 'category': 'Disease', 'icon': 'alert-triangle'},
    'stem borer': {'route': '/pest', 'category': 'Pest', 'icon': 'bug'},
    'rust': {'route': '/pest', 'category': 'Disease', 'icon': 'alert-triangle'},
    'aphid': {'route': '/pest', 'category': 'Pest', 'icon': 'bug'},
    'whitefly': {'route': '/pest', 'category': 'Pest', 'icon': 'bug'},
  };

  IconData _getIconForCategory(String category) {
    switch (category.toLowerCase()) {
      case 'feature':
        return LucideIcons.sparkles;
      case 'crop':
        return LucideIcons.sprout;
      case 'pest':
      case 'disease':
        return LucideIcons.bug;
      case 'profile':
        return LucideIcons.user;
      case 'settings':
        return LucideIcons.settings;
      default:
        return LucideIcons.search;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get matching results
    final results = _query.isEmpty 
        ? [] 
        : _featureMap.entries
            .where((entry) => entry.key.toLowerCase().contains(_query.toLowerCase()))
            .toList();

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _controller,
          autofocus: true,
          cursorColor: AppColors.primaryDark,
          decoration: InputDecoration(
            hintText: 'Search features, crops, pests...',
            border: InputBorder.none,
            hintStyle: TextStyle(color: AppColors.muted),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          style: const TextStyle(
            color: AppColors.primaryDark,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          onChanged: (val) => setState(() => _query = val),
        ),
        backgroundColor: AppColors.primary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: _query.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(LucideIcons.search, size: 64, color: Colors.grey[300]),
                  const SizedBox(height: 16),
                  Text(
                    'Search for features, crops, or diseases',
                    style: TextStyle(color: Colors.grey[500]),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Try searching for:',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        _SearchSuggestion(text: 'Crop Recommendation', onTap: () {
                          _controller.text = 'crop recommendation';
                          setState(() => _query = 'crop recommendation');
                        }),
                        _SearchSuggestion(text: 'Pest Detection', onTap: () {
                          _controller.text = 'pest detection';
                          setState(() => _query = 'pest detection');
                        }),
                        _SearchSuggestion(text: 'Market Prices', onTap: () {
                          _controller.text = 'market prices';
                          setState(() => _query = 'market prices');
                        }),
                        _SearchSuggestion(text: 'Weather', onTap: () {
                          _controller.text = 'weather';
                          setState(() => _query = 'weather');
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : results.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(LucideIcons.searchX, size: 64, color: Colors.grey[300]),
                      const SizedBox(height: 16),
                      Text(
                        'No results found for "$_query"',
                        style: TextStyle(color: Colors.grey[500]),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: results.length,
                  itemBuilder: (context, index) {
                    final entry = results[index];
                    final feature = entry.value;
                    
                    return ListTile(
                      leading: Icon(
                        _getIconForCategory(feature['category']!),
                        color: AppColors.primary,
                      ),
                      title: Text(
                        entry.key.split(' ').map((word) => 
                          word[0].toUpperCase() + word.substring(1)
                        ).join(' '),
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(
                        feature['category']!,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                      ),
                      trailing: const Icon(
                        LucideIcons.chevronRight,
                        size: 18,
                        color: Colors.grey,
                      ),
                      onTap: () {
                        // Navigate to the feature's route
                        context.push(feature['route']!);
                      },
                    );
                  },
                ),
    );
  }
}

class _SearchSuggestion extends StatelessWidget {
  const _SearchSuggestion({
    required this.text,
    required this.onTap,
  });

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Icon(LucideIcons.search, size: 16, color: Colors.grey[600]),
            const SizedBox(width: 12),
            Text(
              text,
              style: TextStyle(color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }
}

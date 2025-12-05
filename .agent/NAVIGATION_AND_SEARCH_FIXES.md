# Navigation and Search Feature Improvements

## Issues to Fix

### 1. Back Button Navigation Issue
**Problem**: Pressing the phone's hardware back button closes the app completely instead of navigating to the previous screen in the app.

**Root Cause**: The app needs proper back button handling to intercept the system back gesture and navigate within the app's navigation stack.

**Solution**: Add a `PopScope` (or `WillPopScope` for older Flutter) widget to handle back button presses in key screens like the dashboard.

### 2. Search Feature Enhancement
**Problem**: The search feature currently only shows a list of crops/pests but doesn't navigate to the actual feature/page when selected.

**Current Behavior**: Shows a SnackBar with "Selected: [item]"  
**Desired Behavior**: Navigate to the relevant page/feature based on the search result

## Implementation Plan

### Fix 1: Back Button Handling

Add this to `DashboardScreen`:

```dart
@override
Widget build(BuildContext context) {
  return PopScope(
    canPop: false,
    onPopInvokedWithResult: (bool didPop, dynamic result) async {
      if (didPop) return;
      
      // Show confirmation dialog before exiting app
      final shouldPop = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Exit App?'),
          content: const Text('Do you want to exit FarmAura?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Exit'),
            ),
          ],
        ),
      );
      
      if (shouldPop == true && context.mounted) {
        // Exit app
        SystemNavigator.pop();
      }
    },
    child: Scaffold(
      // ... rest of dashboard
    ),
  );
}
```

### Fix 2: Enhanced Search with Navigation

Update `SearchScreen` to map search results to actual routes:

```dart
final Map<String, Map<String, dynamic>> _featureMap = {
  // Crops
  'wheat': {'route': '/crop-rec', 'category': 'Crop'},
  'paddy': {'route': '/crop-rec', 'category': 'Crop'},
  'maize': {'route': '/crop-rec', 'category': 'Crop'},
  'cotton': {'route': '/crop-rec', 'category': 'Crop'},
  'sugarcane': {'route': '/crop-rec', 'category': 'Crop'},
  'tomato': {'route': '/crop-rec', 'category': 'Crop'},
  'potato': {'route': '/crop-rec', 'category': 'Crop'},
  'onion': {'route': '/crop-rec', 'category': 'Crop'},
  
  // Pest/Disease
  'pest detection': {'route': '/pest', 'category': 'Pest Detection'},
  'disease scanner': {'route': '/pest', 'category': 'Pest Detection'},
  'leaf blight': {'route': '/pest', 'category': 'Disease'},
  'stem borer': {'route': '/pest', 'category': 'Pest'},
  'rust': {'route': '/pest', 'category': 'Disease'},
  
  // Services/Features
  'market prices': {'route': '/market', 'category': 'Market'},
  'weather': {'route': '/weather', 'category': 'Weather'},
  'soil test': {'route': '/soil', 'category': 'Soil'},
  'crop recommendation': {'route': '/crop-rec', 'category': 'Feature'},
  'ai chat': {'route': '/ai-chat', 'category': 'Feature'},
  'community': {'route': '/community', 'category': 'Feature'},
  'profile': {'route': '/profile', 'category': 'Profile'},
  'settings': {'route': '/settings', 'category': 'Settings'},
  
  // Government Schemes
  'pm kissan': {'route': '/finance', 'category': 'Scheme'},
  'soil health card': {'route': '/soil', 'category': 'Scheme'},
};

// In the ListTile onTap:
onTap: () {
  final searchTerm = results[index].toLowerCase();
  final feature = _featureMap[searchTerm];
  
  if (feature != null) {
    // Navigate to the mapped route
    context.push(feature['route']);
  } else {
    // Fallback: show message or try fuzzy search
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Feature coming soon: ${results[index]}')),
    );
  }
},
```

## Testing Checklist

- [ ] Test back button on dashboard - should show exit confirmation
- [ ] Test back button on sub-pages - should navigate to previous screen
- [ ] Test search for "pest detection" - should navigate to /pest
- [ ] Test search for "market prices" - should navigate to /market
- [ ] Test search for "weather" - should navigate to /weather
- [ ] Test search for unknown terms - should show appropriate message

## Additional Improvements

1. **Add Search Categories**: Group search results by category (Crops, Features, Services)
2. **Recent Searches**: Store and display recent search queries
3. **Smart Suggestions**: Show relevant suggestions as user types
4. **Voice Search Integration**: Already implemented in dashboard, ensure it works with navigation

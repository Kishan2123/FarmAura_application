import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'router/app_router.dart';
import 'theme/app_theme.dart';
import 'models/app_state.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:farmaura/l10n/app_localizations.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppState(),
      child: const FarmauraApp(),
    ),
  );
}

class FarmauraApp extends StatefulWidget {
  const FarmauraApp({super.key});

  @override
  State<FarmauraApp> createState() => _FarmauraAppState();
}

class _FarmauraAppState extends State<FarmauraApp> {
  GoRouter? _router;

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    // Initialize router only once to prevent navigation reset on state changes
    _router ??= createRouter(appState);
    return MaterialApp.router(
      title: 'Farmaura',
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      routerConfig: _router,
      locale: _getLocale(appState.userLanguage),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('hi'),
        Locale('kn', 'IN'),
        Locale('hi', 'KH'),
      ],
    );
  }

  Locale _getLocale(String language) {
    switch (language) {
      case 'Hindi':
        return const Locale('hi');
      case 'Kannada':
        return const Locale('kn', 'IN');
      case 'Khortha':
        return const Locale('hi', 'KH');
      default:
        return const Locale('en');
    }
  }
}

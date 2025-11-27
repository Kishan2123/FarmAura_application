import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
<<<<<<< HEAD
import 'package:go_router/go_router.dart';
import 'router/app_router.dart';
import 'theme/app_theme.dart';
import 'models/app_state.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:farmaura/l10n/app_localizations.dart';
=======
import 'router/app_router.dart';
import 'theme/app_theme.dart';
import 'models/app_state.dart';
>>>>>>> 9d011e077f24875d0231af6f5ff886e1b4e6eeee

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppState(),
      child: const FarmauraApp(),
    ),
  );
}

<<<<<<< HEAD
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

=======
class FarmauraApp extends StatelessWidget {
  const FarmauraApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: false);
>>>>>>> 9d011e077f24875d0231af6f5ff886e1b4e6eeee
    return MaterialApp.router(
      title: 'Farmaura',
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
<<<<<<< HEAD
      routerConfig: _router,
      locale: Locale(appState.userLanguage == 'Hindi' ? 'hi' : 'en'),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('hi'),
      ],
=======
      routerConfig: createRouter(appState),
>>>>>>> 9d011e077f24875d0231af6f5ff886e1b4e6eeee
    );
  }
}

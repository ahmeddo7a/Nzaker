import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nzaker/core/basics/screens/splash_screen.dart';
import 'package:nzaker/core/components/resources/theme_manager/light_theme.dart';

import 'core/components/resources/route_manager.dart';
import 'core/services/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("ar", ""), // OR Locale('ar', 'AE') OR Other RTL locales
      ],
      locale: const Locale("ar", ""),
      theme: lightTheme(),
      onGenerateRoute: RouteGenerator.getRoute,
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
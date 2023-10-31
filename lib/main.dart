import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nzaker/core/basics/screens/splash_screen.dart';
import 'package:nzaker/core/components/resources/color_manager.dart';

import 'core/components/resources/route_manager.dart';

void main() {
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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: ColorManager.mainColor),
        useMaterial3: true,
      ),
      onGenerateRoute: RouteGenerator.getRoute,
      home: const SplashScreen(),
    );
  }
}
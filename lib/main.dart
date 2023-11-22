import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nzaker/core/basics/screens/splash_screen.dart';
import 'package:nzaker/core/components/resources/theme_manager/light_theme.dart';

import 'core/components/resources/route_manager.dart';
import 'core/services/firebase_sevice.dart';
import 'core/services/notification_service.dart';
import 'core/services/service_locator.dart';
import 'firebase_options.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator().init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //await FirebaseApi.initNotification();
  await notificationService.init();
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
      key: navigatorKey,
      locale: const Locale("ar", ""),
      theme: lightTheme(),
      onGenerateRoute: RouteGenerator.getRoute,
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
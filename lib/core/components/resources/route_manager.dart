import 'package:flutter/material.dart';
import '../../../features/results/presentation/screens/home_screen.dart';
import '../../basics/screens/splash_screen.dart';

class Routes {
  static const String splashRoute = '/';
  static const String homeRoute = '/HomeRoute';

}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(child: Text('Undefined')),
      ),
    );
  }
}
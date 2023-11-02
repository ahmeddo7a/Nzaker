import 'package:flutter/material.dart';
import 'package:nzaker/features/results/presentation/screens/country_details_screen.dart';
import '../../../features/results/presentation/screens/home_screen.dart';
import '../../basics/screen_arguments_class.dart';
import '../../basics/screens/splash_screen.dart';

class Routes {
  static const String splashRoute = '/';
  static const String homeRoute = '/HomeRoute';
  static const String countryDetailsRoute = '/CountryDetailsRoute';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case Routes.countryDetailsRoute:
        return MaterialPageRoute(builder: (_) {
          final args = settings.arguments as ScreenArguments<String>;
          return CountryDetailsScreen(countryName:args.data,);
        });

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
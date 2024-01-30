import 'package:flutter/material.dart';
import 'package:movieapp/routes/route_names.dart';
import 'package:movieapp/view/home/screens/home_screen.dart';
import 'package:movieapp/view/splash_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //var args = settings.arguments;
    switch (settings.name) {
      case RouteNames.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}

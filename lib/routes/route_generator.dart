import 'package:auto_booking/main.dart';
import 'package:flutter/material.dart';
import 'package:auto_booking/main.dart';

import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MyHomePage());

      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                body: Center(child: Text('No route defined for'))));
    }
  }
}

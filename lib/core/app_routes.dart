import 'package:flutter/material.dart';
import '../presentation/login/login_screen.dart';
import '../presentation/home/home_screen.dart';

class AppRoutes {
  static const String login = '/';
  static const String home = '/home';

  static Map<String, WidgetBuilder> routes = {
    login: (context) => LoginScreen(),
    home: (context) => HomeScreen(),
  };
}

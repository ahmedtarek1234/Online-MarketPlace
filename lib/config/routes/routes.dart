import 'package:e_commerce/features/homeScreen/presentaion/pages/home.dart';
import 'package:e_commerce/features/login/presentaion/pages/login.dart';
import 'package:e_commerce/features/signUp/presentation/pages/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoutesName {
  static const String login = "login";
  static const String home= "home";
  static const String signUp= "signUp";
}

class AppRoutes {
  static Route onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.login:
        return MaterialPageRoute(
          builder: (context) => logiScreen(),
        );
      case RoutesName.home:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );
      case RoutesName.signUp:
        return MaterialPageRoute(
          builder: (context) => SignUpScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => unDefineRoute(),
        );
    }
  }

  static Widget unDefineRoute() {
    return Scaffold(
      body: Center(child: Text("Route Not Found")),
    );
  }
}

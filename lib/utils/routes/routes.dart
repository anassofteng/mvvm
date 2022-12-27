import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view/home_screen.dart';
import 'package:mvvm/view/login_screen.dart';

import '../../view/SignUp_screen.dart';
import '../../view/Splash_Screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final argument = settings.arguments;

    switch (settings.name) {
      case RoutesName.splashscreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => Splash_Screen());

      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => home_Screen());

      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const login_screen());
      case RoutesName.signup:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignUp_view());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: const Text('no route defined'),
            ),
          );
        });
    }
  }
}

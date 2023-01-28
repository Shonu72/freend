import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter_dating_app/models/models.dart';
import 'package:freend/screens/screens.dart';
import 'package:freend/screens/user/user_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('The Route is: ${settings.name}');

    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case UsersScreen.routeName:
        return UsersScreen.route(user: settings.arguments as User);
      // case OnboardingScreen.routeName:
      //   return OnboardingScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(appBar: AppBar(title: Text('error'))),
      settings: RouteSettings(name: '/error'),
    );
  }
}

class User {}

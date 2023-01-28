import 'package:flutter/material.dart';
import 'package:freend/config/app_route.dart';

class UsersScreen extends StatelessWidget {
  // const UsersScreen({super.key, this.user});
  static const String routeName = '/users';

  static Route route({required User user}) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => UsersScreen(user: user),
    );
  }

  final User user;
  const UsersScreen({
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Screen"),
      ),
    );
  }
}

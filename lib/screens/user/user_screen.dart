import 'package:flutter/material.dart';
import 'package:freend/config/app_route.dart';

class UsersScreen extends StatelessWidget {
  static const String routeName = '/users';

  static Route route({required User user}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: UsersScreen.routeName),
      builder: (context) => UsersScreen(user: user),
    );
  }

  final User user;

  const UsersScreen({super.key,
    required this.user,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: SizedBox(
        height: MediaQuery.of(context).size.height/2,
        child: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: NetworkImage(user.imageUrls[0]),
        fit: BoxFit.cover,
        ),

      ),
    );
  }
}
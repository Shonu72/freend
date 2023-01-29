import 'package:flutter/material.dart';
import 'package:freend/models/models.dart';
import 'package:freend/widgets/custom_appBar.dart';
import 'package:freend/widgets/user_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const customAppBar(),
      body: Column(
        children: [UserCard(user: User.users[0]), ChoiceButton()],
      ),
    );
  }
}

class ChoiceButton extends StatelessWidget {
  final double width;
  final double height;
  final double size;
  final Color color;
  final IconData icon;
  const ChoiceButton(
      {Key? key,
      required this.width,
      required this.height,
      required this.color,
      required this.icon,
      required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: color, boxShadow: [
        BoxShadow(
          color: Colors.grey.withAlpha(50),
          spreadRadius: 4,
          blurRadius: 4,
          offset: const Offset(3, 3),
        )
      ]),
      child: Icon(
        icon,
        color: color,
      ),
    );
  }
}

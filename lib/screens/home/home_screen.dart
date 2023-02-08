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
        children: [
          UserCard(user: User.users[0]),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 60,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                ChoiceButton(
                  width: 60,
                  height: 60,
                  size: 25,
                  color: Color.fromARGB(255, 192, 65, 150),
                  hasGradient: false,
                  icon: Icons.clear_all_outlined,
                ),
                ChoiceButton(
                  width: 80,
                  height: 80,
                  size: 30,
                  color: Colors.white,
                  hasGradient: true,
                  icon: Icons.favorite,
                ),
                ChoiceButton(
                  width: 60,
                  height: 60,
                  size: 25,
                  color: Color.fromARGB(255, 112, 85, 103),
                  hasGradient: false,
                  icon: Icons.watch_later,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChoiceButton extends StatelessWidget {
  final double width;
  final double height;
  final double size;
  final Color color;
  final bool hasGradient;
  final IconData icon;
  const ChoiceButton({
    Key? key,
    required this.width,
    required this.height,
    required this.size,
    required this.color,
    required this.hasGradient,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          gradient: hasGradient
              ? const LinearGradient(
                  colors: [
                    Color.fromARGB(203, 77, 61, 61),
                    Color.fromARGB(255, 130, 58, 106),
                  ],
                )
              : const LinearGradient(
                  colors: [Colors.white, Colors.white],
                ),
          boxShadow: [
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
        size: size,
      ),
    );
  }
}

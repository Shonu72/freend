import 'package:flutter/material.dart';
import 'package:freend/config/theme.dart';

class customAppBar extends StatelessWidget with PreferredSizeWidget {
  const customAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        children: [
          Expanded(
            child: Image.asset(
              'assets/frend.png',
              height: 80,
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 50),
              child: Text(
                "FREEND",
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          )
        ],
      ),
      actions: [
        IconButton(
            onPressed: (() {}),
            icon: const Icon(
              Icons.message,
              color: Color.fromARGB(255, 189, 58, 146),
            )),
        IconButton(
            onPressed: (() {}),
            icon: const Icon(
              Icons.person,
              color: Color.fromARGB(255, 189, 58, 146),
            )),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56);
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freend/config/theme.dart';
import 'package:freend/models/models.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: UserCard(user: User.users[0]),
    );
  }
}

class UserCard extends StatelessWidget {
  final User user;
  const UserCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 1.4,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(user.imageUrls[0])),
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 4,
                        blurRadius: 4,
                        offset: Offset(3, 3))
                  ]),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(200, 0, 0, 0), // gradient on pic
                      Color.fromARGB(0, 0, 0, 0), // gradient on pic
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  )),
            ),
            Positioned(
              bottom: 30,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${user.name}, ${user.age}',
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: Colors.white),
                  ),
                  Text(
                    '${user.jobTitle}',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                  Row(
                    children: [
                      UserImageSmall(imageUrl: user.imageUrls[1]),
                      UserImageSmall(imageUrl: user.imageUrls[2]),
                      UserImageSmall(imageUrl: user.imageUrls[3]),
                      UserImageSmall(imageUrl: user.imageUrls[4]),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class UserImageSmall extends StatelessWidget {
  const UserImageSmall({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8, right: 8),
      height: 60,
      width: 60,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(5)),
    );
  }
}

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
            flex: 2,
            child: Text(
              "FREEND",
              style: Theme.of(context).textTheme.headline4,
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freend/bloc/swipe_bloc.dart';
import 'package:freend/widgets/choice_button.dart';
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
      body: BlocBuilder<SwipeBloc, SwipeState>(
        builder: (context, state){
          if(state is SwipeLoading){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else if(state is SwipeLoaded){
            return Column(
              children: [
                  Draggable(
                    feedback: UserCard(user: state.users[0]),
                    childWhenDragging: UserCard(user: state.users[1]),
                  onDragEnd: (drag) {
                  if (drag.velocity.pixelsPerSecond.dx < 0) {
                    context.read<SwipeBloc>().add(SwipeLeftEvent(user: state.users[0]));
                  print('swipe left');
                  } else {
                    context.read<SwipeBloc>().add(SwipeRightEvent(user: state.users[0]));

                    print('swipe right');
                  }
                  },
                    child: UserCard(user: state.users[0]),
          ),
             Padding(
              padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 60,
              ),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                InkWell(
                  onTap: (){
                    context.read<SwipeBloc>().add(SwipeLeftEvent(user: state.users[0]));
                  },
                  child:  const ChoiceButton(
                  width: 60,
                  height: 60,
                  size: 25,
                  color: Color.fromARGB(255, 192, 65, 150),
                  hasGradient: false,
                  icon: Icons.clear_all_outlined,
                  ),
                ),
                InkWell(
                  onTap: (){
                    context.read<SwipeBloc>().add(SwipeRightEvent(user: state.users[0]));
                  },
                  child: const ChoiceButton(
                  width: 80,
                  height: 80,
                  size: 30,
                  color: Colors.white,
                  hasGradient: true,
                  icon: Icons.favorite,
                  ),
                ),
                  const ChoiceButton(
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
          ], );

          } else{
            return const Text("Something went wrong");
          }
        },
      ),
    );
  }
}

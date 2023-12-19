import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/User.dart';
import '../../../utils/AppTextStyles.dart';
import '../../../utils/Utility.dart';
import '../../../utils/Wigets.dart';
import '../block/game_bloc.dart';

class GameActionPage extends StatefulWidget {
  final List<User> users;

  GameActionPage({Key? key, required this.users}) : super(key: key);

  @override
  _GameActionPage createState() => _GameActionPage(users);
}

class _GameActionPage extends State<GameActionPage>
    with SingleTickerProviderStateMixin {
  GameBloc? myBloc;
  late AnimationController controller;

  final List<User> users;
  String userNick = '';

  _GameActionPage(this.users);

  void startLoading() {
    controller.forward().then(
      (_) {
        if (controller.status == AnimationStatus.completed) {
          onLoadingComplete();
        }
      },
    );
  }

  void stopLoadingAndReset() {
    controller.stop();
    controller.reset();
  }

  void onLoadingComplete() {
    myBloc?.add(OnRevealCardClicked());
  }

  @override
  void initState() {
    super.initState();
    myBloc = context.read<GameBloc>();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
        bloc: myBloc,
        builder: (context, state) {
          if (state is GameInitialState) {
            return Container(
              width: double.infinity,
              color: const Color(0xff1e1e1e),
              child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              MainWidget.toolBar(
                                  "Odsłoń kartę\n i poznaj swoją rolę w rozgrywce"),
                              const SizedBox(height: 32),
                              const  Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Wybież ofiarę tej nocy ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffA4A4A4),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 32),
                              userList(),
                            ],
                          ),
                        ),
                      ),
                      MainWidget.orangeButton(
                          text: 'Dalej',
                          callback: () {
                            Utility.workingOn();
                          }),
                    ],
                  )),
            );
          }
          return const CircularProgressIndicator();
        });
  }


  Widget userList() => Container(
        alignment: Alignment.center,
        width: double.infinity,
        child: const Text(
          'Marek',
          textAlign: TextAlign.left,
          style: AppTextStyles.text20_600,
        ),
      );
}

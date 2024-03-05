import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/User.dart';
import '../../../utils/AppTextStyles.dart';
import '../../../utils/Utility.dart';
import '../../../utils/Wigets.dart';
import '../block/game_bloc.dart';

class GameRevealKilledPage extends StatefulWidget {
  const GameRevealKilledPage({Key? key}) : super(key: key);

  @override
  _GameRevealKilledPage createState() => _GameRevealKilledPage();
}

class _GameRevealKilledPage extends State<GameRevealKilledPage> {
  GameBloc? myBloc;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    myBloc = context.read<GameBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
      bloc: myBloc,
      builder: (context, state) {
        if (state is GameRevealKilledPersonState) {
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
                            MainWidget.toolBar("Zabici gracze:"),
                            const SizedBox(height: 32),
                            const Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Zabici gracze:",
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
                            userList(state.usersThatChanged),
                          ],
                        ),
                      ),
                    ),
                    MainWidget.orangeButton(
                        text: 'Dalej',
                        callback: () {
                          myBloc?.add(OnNextInKilledPageClicked());
                        }),
                  ],
                )),
          );
        }
        return MainWidget.loadingWidget("Game reveal killed loading...");
      },
    );
  }

  Widget userList(List<User> users) {
    return Container(
        width: double.infinity,
        height: 850, //ToDo rozszeż rodzica do max
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              width: double.infinity,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    users[index].name,
                    style: const TextStyle(
                      fontFamily: 'Clash Display Variable',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffffffff),
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }

  Widget userItem(User user) {
    return ListTile(
      title: Text(
        user.name,
        style: AppTextStyles.text_C_14_600,
      ),
    );
  }
}

/*
Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.usersThatChanged.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(state.usersThatChanged[index].name),
                    );
                  },
                ),
              ),
              MainWidget.orangeButton(
                  text: 'Dalej',
                  callback: () {
                    myBloc?.add(OnNextInKilledPageClicked());
                  }),
            ],
          );

          */

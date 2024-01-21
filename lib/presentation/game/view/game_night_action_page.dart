import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/User.dart';
import '../../../utils/Wigets.dart';
import '../block/game_bloc.dart';

class GameNightActionPage extends StatefulWidget {
  GameNightActionPage({Key? key}) : super(key: key);

  @override
  _GameActionPage createState() => _GameActionPage();
}

class _GameActionPage extends State<GameNightActionPage> {
  GameBloc? myBloc;
  late AnimationController controller;
  String? _selectedUserName;

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
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
        bloc: myBloc,
        builder: (context, state) {
          if (state is GameNightState) {
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
                              MainWidget.toolBar("Wybierz gracza Noc"),
                              const SizedBox(height: 32),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  state.user.character.instruction,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffA4A4A4),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 32),
                              userList(state.users),
                            ],
                          ),
                        ),
                      ),
                      MainWidget.orangeButton(
                          text: 'Dalej',
                          callback: () {
                            User? selectedUser = state.users.firstWhere(
                              (user) => user.name == _selectedUserName,
                            );
                           //ToDo dodaj sprawdzenie czy user nie jest null!
                            myBloc
                                ?.add(OnMakeActionClicked(user: selectedUser));
                          }),
                    ],
                  )),
            );
          }
          return const CircularProgressIndicator();
        });
  }

  Widget userList(List<User> users) {
    return Container(
        width: double.infinity,
        height: 850, //ToDo rozszeż rodzica do max
        child: ListView.separated(
          itemCount: users.length,
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              color: Color(0x44d9d9d9),
              height: 1,
            );
          },
          itemBuilder: (BuildContext context, int index) {
            final user = users[index];
            return UserRadioListTile(
              user: user,
              selectedUserName: _selectedUserName,
              onSelectedUserChanged: (newSelectedUserName) {
                setState(() {
                  _selectedUserName = newSelectedUserName;
                });
              },
            );
          },
        ));
  }
}

class UserRadioListTile extends StatelessWidget {
  final User user;
  final String? selectedUserName;
  final ValueChanged<String?> onSelectedUserChanged;

  UserRadioListTile({
    Key? key,
    required this.user,
    required this.selectedUserName,
    required this.onSelectedUserChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onSelectedUserChanged(user.name),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        decoration: BoxDecoration(
            // Dodaj dowolne dekoracje, które chcesz zastosować do elementu listy
            ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/card.png"),
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Text(
                user.name,
                style: TextStyle(color: Colors.white),
              ),
            ),
            Radio<String>(
              value: user.name,
              groupValue: selectedUserName,
              onChanged: (value) => onSelectedUserChanged(value),
            ),
          ],
        ),
      ),
    );
  }
}

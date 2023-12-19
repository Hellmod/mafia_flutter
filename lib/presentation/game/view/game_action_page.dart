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

class _GameActionPage extends State<GameActionPage>{
  GameBloc? myBloc;
  late AnimationController controller;

  final List<User> users;
  String? _selectedUserName;

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


  Widget userList() {
    return Container(
      width: double.infinity,
      height: 50,// Otocz ListView widgetem Expanded
      child: ListView(
        children: widget.users.map((User user) {
          return UserRadioListTile(
            user: user,
            selectedUserName: _selectedUserName,
            onSelectedUserChanged: (newSelectedUserName) {
              setState(() {
                _selectedUserName = newSelectedUserName;
              });
            },
          );
        }).toList(),
      ),
    );
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
              backgroundImage: AssetImage("assets/images/card.png"), // Zastąp ścieżkę obrazka avatarem użytkownika
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

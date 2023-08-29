import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../lobby_many_phone/block/lobby_many_phone_bloc.dart';

class UserInputOrDisplay extends StatelessWidget {
  final LobbyManyPhoneBloc? myBloc;

  UserInputOrDisplay({
    required this.myBloc,
  });

  @override
  Widget build(BuildContext context) {
    bool isUserInGame = myBloc?.state.isUserInGame ?? false;
    if (isUserInGame) {
      return Center(
        child: Text(
          myBloc?.state.user.name ?? "Nieznany",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      );
    } else {
      String userNick = ""; // lokalna zmienna
      return Container(
        width: double.infinity,
        height: 56,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                height: 52,
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0x4cffffff)),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x192f2b43),
                      offset: Offset(0, 1),
                      blurRadius: 1.5,
                    ),
                  ],
                ),
                child: TextField(
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Twój nick',
                    hintStyle: TextStyle(color: Colors.white54),
                    border: InputBorder.none,
                  ),
                  onChanged: (text) {
                    userNick = text;
                  },
                ),
              ),
            ),
            SizedBox(width: 8.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: Colors.white,
                  width: 1.0,
                ),
              ),
              child: IconButton(
                icon: const Icon(Icons.check, color: Colors.white),
                onPressed: () {
                  myBloc!.add(OnSaveUserClick(userName: userNick));
                },
              ),
            ),
          ],
        ),
      );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafia/utils/character/Character.dart';

import '../../../models/User.dart';
import '../../../utils/Utility.dart';
import '../block/lobby_many_phone_bloc.dart';

class LobbyManyPhoneCharacterChoose extends StatefulWidget {
  final List<Character> characters;

  LobbyManyPhoneCharacterChoose({Key? key, required this.characters})
      : super(key: key);

  @override
  _LobbyManyPhoneCharacterChoose createState() =>
      _LobbyManyPhoneCharacterChoose(characters);
}

class _LobbyManyPhoneCharacterChoose
    extends State<LobbyManyPhoneCharacterChoose> {
  LobbyManyPhoneBloc? myBloc;

  final List<Character> characters;
  String userNick = '';

  _LobbyManyPhoneCharacterChoose(this.characters);

  @override
  void initState() {
    super.initState();
    myBloc = context.read<LobbyManyPhoneBloc>();
  }

  String formatRoomId(String? roomId) {
    if (roomId == null) return "000 - 000";
    if (roomId.length != 6) return roomId;
    return roomId.substring(0, 3) + " - " + roomId.substring(3, 6);
  }

  Widget yourUserListWidget(List<User> users) {
    return Container(
        height: 50,
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
                    "${index + 1}.",
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0x99ffffff),
                    ),
                  ),
                  Text(
                    users[index].name,
                    style: const TextStyle(
                      fontFamily: 'Clash Display Variable',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffffffff),
                    ),
                  ),
                  IconButton(
                    //ToDo usuń
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      Utility.workingOn();
                    },
                  ),
                ],
              ),
            );
          },
        ));
  }

  Widget toolBar() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(
                color: Colors.white,
                width: 1.0,
              ),
            ),
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          const Text(
            'Wybór postaci',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              height: 1.5999999728,
              color: Color(0xffa3a3a3),
            ),
          ),
        ],
      );

  Widget pageTitle() => Container(
      width: double.infinity,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Wybierz role',
            style: TextStyle(
              fontFamily: 'Clash Display Variable',
              fontSize: 24,
              fontWeight: FontWeight.w600,
              height: 1.2999999523,
              color: Color(0xffffffff),
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Wybierz role do rozgrywki, które zostaną rozlosowane wśród graczy',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 16,
              fontWeight: FontWeight.w500,
              height: 1.5999999728,
              color: Color(0xffffffff),
            ),
          ),
        ],
      ));

  Widget villageSeparator() =>Row(
    children: [
      // Linia po lewej stronie
      Expanded(
        child: Container(
          height: 1,
          color: Color(0xFFCCCACA),
        ),
      ),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          'Wieś',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ),
      Expanded(
        child: Container(
          height: 1,
          color: Color(0xFFCCCACA),
        ),
      ),
    ],
  );





  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          color: const Color(0xff1e1e1e),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      toolBar(),
                      const SizedBox(height: 40),
                      pageTitle(),
                      const SizedBox(height: 24),
                      villageSeparator(),
                      const SizedBox(height: 24),
                      RoleCard(
                          imageUrl: 'assets/images/character_sailor.png',
                          roleName: 'Szeryf'),
                    ],
                  )),
              Positioned(
                left: 16,
                right: 16,
                bottom: 32,
                child: Material(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Utility.workingOn();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFFFFB445), Color(0xFFD85C30)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            'Dalej',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ), //Dalej button
            ],
          ),
        ),
      ),
    );
  }
}

class RoleCard extends StatelessWidget {
  final String imageUrl;
  final String roleName;

  RoleCard({required this.imageUrl, required this.roleName});

  @override
  Widget build(BuildContext context) {
    return Container(
      // kartaxhD (267:21293)
      margin: EdgeInsets.fromLTRB(0, 0, 16, 0),
      width: 171,
      height: 240,
      decoration: BoxDecoration(
        color: Color(0x33ffffff),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Positioned(
            // rectangle38555G3 (267:21294)
            left: 10,
            top: 10,
            child: Align(
              child: SizedBox(
                width: 151,
                height: 220,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            // shadowB4B (267:21295)
            left: 10,
            top: 178,
            child: Align(
              child: SizedBox(
                width: 151,
                height: 52,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment(-0.007, 0.538),
                      end: Alignment(0, -1),
                      colors: <Color>[Color(0xff161a22), Color(0x0027343f)],
                      stops: <double>[0, 1],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            // marynarzBTV (267:21296)
            left: 22,
            top: 193,
            child: Align(
              child: SizedBox(
                width: 65,
                height: 21,
                child: Text(
                  roleName,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

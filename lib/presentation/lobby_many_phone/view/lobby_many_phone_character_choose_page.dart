import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafia/utils/character/Character.dart';

import '../../../utils/AppTextStyles.dart';
import '../../../utils/Utility.dart';
import '../../wigets/RoleCard.dart';
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

  Widget villageSeparator() => Row(
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
                      RoleCardWidget(
                        imageUrl: 'assets/images/character_sailor.png',
                        roleName: 'Szeryf',
                      ),
                      const SizedBox(height: 16),
                      RoleCardWidget(
                          imageUrl: 'assets/images/character_sailor.png',
                          roleName: 'Marynarz'),
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
                        gradient: AppTextStyles.goldGradient,
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









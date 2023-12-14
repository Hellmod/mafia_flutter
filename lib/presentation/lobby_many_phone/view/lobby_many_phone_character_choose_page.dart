import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafia/utils/character/Character.dart';

import '../../../utils/AppTextStyles.dart';
import '../../../utils/Utility.dart';
import '../../../utils/character/CharacterRepository.dart';
import '../../../utils/character/Pirates.dart';
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

  void navGame() {
    Navigator.pushNamed(context, '/game');
  }

  final List<Character> characters;
  String userNick = '';

  _LobbyManyPhoneCharacterChoose(this.characters);

  @override
  void initState() {
    super.initState();
    myBloc = context.read<LobbyManyPhoneBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LobbyManyPhoneBloc, LobbyManyPhoneState>(
        bloc: myBloc,
        builder: (context, state) {
          if (state is LobbyManyPhoneCharacterChooseState) {
            return Container(
              width: double.infinity,
              color: const Color(0xff1e1e1e),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Stack(
                        fit: StackFit.loose,
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
                                CharacterGrid(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  bottomBar(state.charactersToChoose),
                ],
              ),
            );
          }
          return const CircularProgressIndicator();
        });
  }

  Widget bottomBar(int amount) => Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0x00343F00), Color(0xFF161A22)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Expanded(
              flex: 3,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    amount.toString() + '  ',
                    style: AppTextStyles.textInter(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Pozostałych\n wyborów',
                    style: AppTextStyles.textInter(
                        fontSize: 10, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 7,
                child: InkWell(
                  onTap: () {
                    //RM
                    navGame();
                   // Utility.workingOn();
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
                          style: AppTextStyles.text16_600,
                        ),
                      ),
                    ),
                  ),
                )),
          ]),
        ),
      );

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
}

class CharacterGrid extends StatelessWidget {
  final characters = CharacterRepository.instance.getCharacters();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: characters
          .map((character) => RoleCardWidget(character: character))
          .toList(),
    );
  }
}
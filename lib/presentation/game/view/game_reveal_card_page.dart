import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafia/utils/character/Character.dart';

import '../../../utils/AppTextStyles.dart';
import '../../../utils/Utility.dart';
import '../../../utils/Wigets.dart';
import '../../../utils/character/CharacterRepository.dart';
import '../../wigets/RoleCard.dart';
import '../block/game_bloc.dart';

class GameRevealCard extends StatefulWidget {
  final List<Character> characters;

  GameRevealCard({Key? key, required this.characters}) : super(key: key);

  @override
  _GameRevealCard createState() => _GameRevealCard(characters);
}

class _GameRevealCard extends State<GameRevealCard> {
  GameBloc? myBloc;

  final List<Character> characters;
  String userNick = '';

  _GameRevealCard(this.characters);

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
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Stack(
                        //RM
                        fit: StackFit.loose,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                MainWidget.toolBar(
                                    "Odsłoń kartę\n i poznaj swoją rolę w rozgrywce"),
                                const SizedBox(height: 40),
                                pageTitle(),
                                const SizedBox(height: 24),
                                card(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // bottomBar(state.charactersToChoose),
                ],
              ),
            );
          }
          return const CircularProgressIndicator();
        });
  }

  Widget pageTitle() => Container(
        alignment: Alignment.center,
        width: double.infinity,
        child: const Text(
          'Marek',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Clash Display Variable',
            fontSize: 24,
            fontWeight: FontWeight.w600,
            height: 1.3,
            color: Color(0xffffffff),
          ),
        ),
      );

  Widget card() => AspectRatio(
        aspectRatio: 4 / 6,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFF1E1E1E),
            borderRadius: BorderRadius.circular(24.0),
            border: Border.all(
              color: Colors.white.withOpacity(0.2),
              width: 16.0,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(24.0),
                border: Border.all(
                  color: Colors.white.withOpacity(0.2),
                  width: 1.0,
                ),
              ),
              child: Stack(
                fit: StackFit.expand, // Zmień StackFit.loose na StackFit.expand
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // Dodano, aby rozłożyć dzieci równomiernie
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // Zmieniono na CrossAxisAlignment.start
                      children: [
                        const Text(
                          'Mafia',
                          style: AppTextStyles.text_C_14_600,
                        ),
                        Center(
                            child: Column(children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: Color(0xFF4b4b4b),
                              shape: BoxShape.circle,
                            ),
                            padding: EdgeInsets.all(8),
                            child: const Icon(
                              Icons.fingerprint,
                              size: 32,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Naciśnij i przytrzymaj,\naby odsłonić rolę',
                            textAlign: TextAlign.center,
                            style: AppTextStyles.text12_500,
                          ),
                        ])),
                        const Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            'Mafia',
                            style: AppTextStyles.text_C_14_600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

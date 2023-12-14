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
                        fit: StackFit.loose,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                MainWidget.toolBar(
                                    "Odsłoń kartę\n i poznaj swoją rolę w rozgrywce"
                                ),
                                const SizedBox(height: 40),
                                pageTitle(),
                                const SizedBox(height: 24),
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

}

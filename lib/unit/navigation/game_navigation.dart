import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafia/presentation/game/view/game_day_page.dart';
import '../../presentation/game/block/game_bloc.dart';
import '../../presentation/game/view/game_night_action_page.dart';
import '../../presentation/game/view/game_reveal_card_page.dart';
import '../../presentation/game/view/game_reveal_card_page_card_reviled_page.dart';
import '../../presentation/game/view/game_reveal_killed_page.dart';
import '../../presentation/game/view/game_waiting_page.dart';

class GameNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
      builder: (context, state) {
        if (state is GameInitialState) {
          return GameRevealCard(characters: []);
          //return GameActionPage(users: [User(name: 'Ala', id: '1'),User(name: 'Mietek', id: '2')],);
          //return GameRevealCardReviled(character: Pirates(),);
          //return GameRevealCard(characters: []);
        } else if (state is GameRealCardState) {
          return GameRevealCardReviled();
        } else if (state is GameNightState) {
          return GameNightActionPage();
        } else if (state is GameDayState) {
          return GameDayPage();
        } else if (state is GameWaitingForOthersActionsState) {
          return GameWaitingPage();
        } else if (state is GameRevealKilledPersonState) {
          return GameRevealKilledPage();
        } else {
          return Container(
              child: const Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}

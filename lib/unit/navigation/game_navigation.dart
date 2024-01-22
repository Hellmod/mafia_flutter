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
          debugPrint("MPMP state GameInitialState");
          return GameRevealCard(characters: []);
        } else if (state is GameRealCardState) {
          return GameRevealCardReviled();
        } else if (state is GameNightState) {
          debugPrint("MPMP state GameNightState");
          return GameNightActionPage();
        } else if (state is GameDayState) {
          debugPrint("MPMP state GameDayState");
          return GameDayPage();
        } else if (state is GameWaitingForOthersActionsState) {
          debugPrint("MPMP state GameWaitingForOthersActionsState");
          return GameWaitingPage();
        } else if (state is GameRevealKilledPersonState) {
          debugPrint("MPMP state GameRevealKilledPersonState");
          return GameRevealKilledPage();
        } else {
          return Container(
              child: const Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}

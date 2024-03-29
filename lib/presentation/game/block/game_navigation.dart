import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafia/presentation/game/view/game_day_page.dart';
import '../../../utils/Wigets.dart';
import 'game_bloc.dart';
import '../view/game_finish_page.dart';
import '../view/game_night_action_page.dart';
import '../view/game_reveal_card_page.dart';
import '../view/game_reveal_card_page_card_reviled_page.dart';
import '../view/game_reveal_killed_page.dart';
import '../view/game_waiting_page.dart';

class GameNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
      builder: (context, state) {
        if (state is GameInitialState) {
          debugPrint("MPMP state GameNavigator GameInitialState");
          return GameRevealCard();
        } else if (state is GameRealCardState) {
          debugPrint("MPMP state GameNavigator GameRealCardState");
          return GameRevealCardReviled();
        } else if (state is GameNightState) {
          debugPrint("MPMP state GameNavigator GameNightState");
          return GameNightActionPage();
        } else if (state is GameDayState) {
          debugPrint("MPMP state GameNavigator GameDayState");
          return GameDayPage();
        } else if (state is GameWaitingForOthersActionsState) {
          debugPrint("MPMP state GameNavigator GameWaitingForOthersActionsState");
          return GameWaitingPage();
        } else if (state is GameRevealKilledPersonState) {
          debugPrint("MPMP state GameNavigator GameRevealKilledPersonState");
          return GameRevealKilledPage();
        }else if (state is GameFinishedState) {
          debugPrint("MPMP state GameNavigator GameFinishedState");
          return GameFinishPage();
        } else {
          debugPrint("MPMP state else in GameNavigator: ${state.toString()}");
          return MainWidget.loadingWidget("GameNavigator loading...");
        }
      },
    );
  }
}

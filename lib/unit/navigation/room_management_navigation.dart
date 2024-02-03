import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafia/presentation/game/view/game_day_page.dart';
import 'package:mafia/presentation/room_management/block/room_management_bloc.dart';
import '../../presentation/game/block/game_bloc.dart';
import '../../presentation/game/view/game_finish_page.dart';
import '../../presentation/game/view/game_night_action_page.dart';
import '../../presentation/game/view/game_reveal_card_page.dart';
import '../../presentation/game/view/game_reveal_card_page_card_reviled_page.dart';
import '../../presentation/game/view/game_reveal_killed_page.dart';
import '../../presentation/game/view/game_waiting_page.dart';
import '../../presentation/room_management/view/room_management_token_page.dart';

class RoomManagementNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoomManagementBloc, RoomManagementState>(
      builder: (context, state) {
        if (state is InitialState) {
          debugPrint("MPMP state InitialState");
          return RoomManagementTokenPage();
        }else if (state is NavToLobbyManyPhoneState) {
          debugPrint("MPMP state NavToLobbyManyPhoneState");
          Navigator.pushNamed(context, '/lobby', arguments: {'roomId': state.roomId});
          return Container();
        }
        else {
          return Container(
              child: const Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}

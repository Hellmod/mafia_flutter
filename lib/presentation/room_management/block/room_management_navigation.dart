import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafia/presentation/game/view/game_day_page.dart';
import 'package:mafia/presentation/room_management/block/room_management_bloc.dart';
import '../../../utils/Wigets.dart';
import '../../game/block/game_bloc.dart';
import '../../game/view/game_finish_page.dart';
import '../../game/view/game_night_action_page.dart';
import '../../game/view/game_reveal_card_page.dart';
import '../../game/view/game_reveal_card_page_card_reviled_page.dart';
import '../../game/view/game_reveal_killed_page.dart';
import '../../game/view/game_waiting_page.dart';
import '../view/room_management_token_page.dart';

class RoomManagementNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<RoomManagementBloc, RoomManagementState>(
      listener: (context, state) {
        if (state is NavToLobbyManyPhoneState) {
          Navigator.pushNamed(context, '/lobby', arguments: {
            'roomId': state.roomId
          }).then((value) => {
                BlocProvider.of<RoomManagementBloc>(context).add(RestartBlock())
              });
        }
      },
      child: BlocBuilder<RoomManagementBloc, RoomManagementState>(
        builder: (context, state) {
          if (state is InitState) {
            debugPrint("MPMP state RoomManagementNavigator RoomManagementTokenState");
            return RoomManagementTokenPage();
          }else {
            debugPrint("MPMP state RoomManagementNavigator else: ${state.toString()}");
            return MainWidget.loadingWidget("RoomManagementNavigator loading... ${state.toString()}");//RM
          }
        },
      ),
    );
  }
}

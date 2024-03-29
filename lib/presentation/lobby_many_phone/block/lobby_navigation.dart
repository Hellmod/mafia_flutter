import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafia/presentation/lobby_many_phone/block/lobby_bloc.dart';

import '../../../utils/Wigets.dart';
import '../view/lobby_character_choose_page.dart';
import '../view/lobby_lobby_user_list_page.dart';
import '../../room_management/view/room_management_token_page.dart';
import '../view/lobby_loading_page.dart';

class LobbyNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LobbyBloc, LobbyState>(
      listener: (context, state) {
        if (state is NavigateToGamePageState) {
          debugPrint("MPMP state LobbyNavigator NavigateToGamePageState");
          Navigator.pushNamed(context, '/game', arguments: {'roomId': state.roomId})
              .then((value) => {
                BlocProvider.of<LobbyBloc>(context).add(RestartBlock())
              }
          );
        }
      },
      child: BlocBuilder<LobbyBloc, LobbyState>(
        builder: (context, state) {
          if (state is LobbyUserListState) {
            debugPrint("MPMP state LobbyNavigator LobbyUserListState");
            return LobbyUserListPage();
          } else if (state is LoadingState) {
            debugPrint("MPMP state LobbyNavigator LoadingState");
            return LobbyLoadingPage();
          } else if (state is LobbyManyPhoneCharacterChooseState) {
            debugPrint("MPMP state LobbyNavigator LobbyManyPhoneCharacterChooseState");
            return LobbyCharacterChoosePage();
          } else {
            debugPrint("MPMP state LobbyNavigator else: ${state.toString()}");
            return MainWidget.loadingWidget("LobbyNavigator loading... ${state.toString()}");
          }
        },
      ),
    );
  }
}


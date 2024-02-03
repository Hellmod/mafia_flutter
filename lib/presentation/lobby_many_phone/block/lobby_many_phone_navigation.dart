import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafia/presentation/lobby_many_phone/block/lobby_many_phone_bloc.dart';

import '../view/lobby_many_phone_character_choose_page.dart';
import '../view/lobby_many_phone_lobby_user_list_page.dart';
import '../../room_management/view/room_management_token_page.dart';
import '../view/lobby_waiting_page.dart';

class LobbyManyPhoneNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LobbyManyPhoneBloc, LobbyManyPhoneState>(
      listener: (context, state) {
        if (state is NavigateToGamePageState) {
          debugPrint("MPMP state NavigateToGamePageState");
          Navigator.pushNamed(context, '/game', arguments: {'roomId': state.roomId});
        }
      },
      child: BlocBuilder<LobbyManyPhoneBloc, LobbyManyPhoneState>(
        builder: (context, state) {
          if (state is LobbyUserListState) {
            debugPrint("MPMP state LobbyUserListState");
            return LobbyUserList();
          } else if (state is LoadingState) {
            debugPrint("MPMP state LoadingState");
            return LobbyLoadingPage();
          } else if (state is State) {
            debugPrint("MPMP state LobbyManyPhoneCharacterChooseState");
            return LobbyPhoneCharacterChoose();
          } else {
            return Container(
                child: const Center(child: CircularProgressIndicator()));
          }
        },
      ),
    );
  }
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafia/presentation/lobby_many_phone/block/lobby_many_phone_bloc.dart';

import '../../presentation/lobby_many_phone/view/lobby_many_phone_character_choose_page.dart';
import '../../presentation/lobby_many_phone/view/lobby_many_phone_lobby_user_list_page.dart';
import '../../presentation/lobby_many_phone/view/lobby_many_phone_token_page.dart';

class LobbyManyPhoneNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LobbyManyPhoneBloc, LobbyManyPhoneState>(
      listener: (context, state) {
        if (state is NavigateToGamePageState) {
          Navigator.pushNamed(context, '/game', arguments: {'roomId': state.roomId});
        }
      },
      child: BlocBuilder<LobbyManyPhoneBloc, LobbyManyPhoneState>(
        builder: (context, state) {
          if (state is LobbyManyPhoneInitial) {
            return LobbyTokenScreen();
          } else if (state is LobbyManyPhoneUserListState) {
            return LobbyManyPhoneLobbyUserList(users: state.users);
          } else if (state is LobbyManyPhoneCharacterChooseState) {
            return LobbyManyPhoneCharacterChoose(characters: []);
          } else {
            return Container(
                child: const Center(child: CircularProgressIndicator()));
          }
        },
      ),
    );
  }
}


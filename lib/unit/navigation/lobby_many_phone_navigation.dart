import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafia/presentation/lobby_many_phone/block/lobby_many_phone_bloc.dart';

import '../../presentation/lobby_many_phone/view/lobby_many_phone_lobby_user_list_page.dart';
import '../../presentation/lobby_many_phone/view/lobby_many_phone_token_page.dart';

class LobbyManyPhoneNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LobbyManyPhoneBloc, LobbyManyPhoneState>(
      builder: (context, state) {
        if (state is LobbyManyPhoneInitial) {
          return LobbyTokenScreen();
        } else if (state is LobbyManyPhoneUserListState) {
          debugPrint("RMRM6 ${state.users}");
          return LobbyManyPhoneLobbyUserList(users: state.users);
        } else {
          return Container(child: const Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}

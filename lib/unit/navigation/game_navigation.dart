import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafia/presentation/game/view/game_reveal_card_page.dart';
import 'package:mafia/presentation/lobby_many_phone/block/lobby_many_phone_bloc.dart';

import '../../presentation/game/block/game_bloc.dart';
import '../../presentation/lobby_many_phone/view/lobby_many_phone_character_choose_page.dart';
import '../../presentation/lobby_many_phone/view/lobby_many_phone_lobby_user_list_page.dart';
import '../../presentation/lobby_many_phone/view/lobby_many_phone_token_page.dart';

class GameNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
      builder: (context, state) {
        if (state is GameInitialState) {
          return GameRevealCard(characters: []);
        } else {
          return Container(child: const Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}

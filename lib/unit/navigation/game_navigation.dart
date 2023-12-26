import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/User.dart';
import '../../presentation/game/block/game_bloc.dart';
import '../../presentation/game/view/game_action_page.dart';
import '../../presentation/game/view/game_reveal_card_page.dart';

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
        } else {
          return Container(
              child: const Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}

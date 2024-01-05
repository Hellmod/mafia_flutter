import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../block/game_bloc.dart';

class GameWaitingPage extends StatefulWidget {
  const GameWaitingPage({Key? key}) : super(key: key);

  @override
  _GameWaitingPage createState() => _GameWaitingPage();
}

class _GameWaitingPage extends State<GameWaitingPage> {
  GameBloc? myBloc;
  late AnimationController controller;


  @override
  void initState() {
    super.initState();
    myBloc = context.read<GameBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
        bloc: myBloc,
        builder: (context, state) {
          if (state is GameWaitingForOthersActionsState) {
            return const CircularProgressIndicator();
          }
          return const CircularProgressIndicator();
        });
  }

}
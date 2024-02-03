import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../services/FirebaseGameService.dart';
import 'game_navigation.dart';
import 'game_bloc.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key, required this.roomId});
  final String roomId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:  BlocProvider(
        create: (context) => GameBloc(
          FirebaseGameService(roomId),
        ),
        child: GameNavigator()
    ));
  }
}


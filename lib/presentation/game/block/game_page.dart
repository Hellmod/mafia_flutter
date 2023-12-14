import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafia/services/FirebaseService.dart';

import '../../../unit/navigation/game_navigation.dart';
import 'game_bloc.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:  BlocProvider(
        create: (context) => GameBloc(
          FirebaseService(),
        ),
        child: GameNavigator()
    ));
  }
}


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
    return PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          print("MPMP onBackPressed GamePage");
          Navigator.of(context).pushNamedAndRemoveUntil('/dashboard', (Route<dynamic> route) => false);
        },
        child: Scaffold(
            body: BlocProvider(
                create: (context) => GameBloc(
                      FirebaseGameService(roomId),
                    ),
                child: GameNavigator())
        )
    );
  }
}

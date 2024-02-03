import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafia/services/FirebaseService.dart';

import '../../../services/LobbyService.dart';
import 'lobby_navigation.dart';
import 'lobby_bloc.dart';

class LobbyPage extends StatelessWidget {
  const LobbyPage({super.key, required this.roomId});
  final String roomId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:  BlocProvider(
        create: (context) => LobbyBloc(
          LobbyService(roomId),
        ),
        child: LobbyNavigator()
    ));
  }
}
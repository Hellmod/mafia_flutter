import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafia/services/FirebaseService.dart';

import '../../../services/LobbyService.dart';
import 'lobby_many_phone_navigation.dart';
import 'lobby_many_phone_bloc.dart';

class LobbyManyPhonePage extends StatelessWidget {
  const LobbyManyPhonePage({super.key, required this.roomId});
  final String roomId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:  BlocProvider(
        create: (context) => LobbyManyPhoneBloc(
          LobbyService(roomId),
        ),
        child: LobbyManyPhoneNavigator()
    ));
  }
}
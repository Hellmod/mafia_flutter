import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../unit/navigation/lobby_many_phone_navigation.dart';
import 'lobby_many_phone_bloc.dart';

class LobbyManyPhonePage extends StatelessWidget {
  const LobbyManyPhonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LobbyManyPhoneBloc(),
      child: LobbyManyPhoneNavigator()
    );
  }
}


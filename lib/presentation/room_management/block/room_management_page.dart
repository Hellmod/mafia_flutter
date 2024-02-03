import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafia/services/FirebaseService.dart';

import 'room_management_navigation.dart';
import 'room_management_bloc.dart';

class RoomManagementPage extends StatelessWidget {
  const RoomManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:  BlocProvider(
        create: (context) => RoomManagementBloc(
          FirebaseService(),
        ),
        child: RoomManagementNavigator()
    ));
  }
}


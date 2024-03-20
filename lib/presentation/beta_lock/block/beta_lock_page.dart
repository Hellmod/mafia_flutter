import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'BetaLockService.dart';
import 'beta_lock_bloc.dart';
import 'beta_lock_navigation.dart';

class BetaLockPage extends StatelessWidget {
  const BetaLockPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:  BlocProvider(
        create: (context) => BetaLockBloc(
          BetaLockService(),
        ),
        child: BetaLockNavigator()
    ));
  }
}


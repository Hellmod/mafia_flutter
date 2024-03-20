import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafia/presentation/beta_lock/block/beta_lock_bloc.dart';

import '../../../utils/Wigets.dart';
import '../view/beta_lock_page.dart';

class BetaLockNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<BetaLockBloc, BetaLockState>(
      listener: (context, state) {
        if (state is NavToHomeState) {
          Navigator.pushNamed(context, '/dashboard').then((value) =>
              {BlocProvider.of<BetaLockBloc>(context).add(RestartBlock())});
        }
      },
      child: BlocBuilder<BetaLockBloc, BetaLockState>(
        builder: (context, state) {
          if (state is InitState) {
            debugPrint(
                "MPMP state BetaLockNavigator InitState");
            return BetaLockPage();
          } else {
            debugPrint(
                "MPMP state BetaLockNavigator else: ${state.toString()}");
            return MainWidget.loadingWidget(
                "BetaLockNavigator loading... ${state.toString()}"); //RM
          }
        },
      ),
    );
  }
}

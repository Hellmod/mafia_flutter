import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/Wigets.dart';
import '../block/lobby_bloc.dart';

class LobbyLoadingPage extends StatefulWidget {
  const LobbyLoadingPage({Key? key}) : super(key: key);

  @override
  _LobbyLoadingPage createState() => _LobbyLoadingPage();
}

class _LobbyLoadingPage extends State<LobbyLoadingPage> {
  LobbyBloc? myBloc;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    myBloc = context.read<LobbyBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LobbyBloc, LobbyState>(
        bloc: myBloc,
        builder: (context, state) {
          if (state is LoadingState) {
            return Container(
              width: double.infinity,
              color: const Color(0xff1e1e1e),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MainWidget.toolBar("Wczytywanie..."),
                    const Expanded(
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          // To sprawi, że elementy będą razem
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return MainWidget.loadingWidget("Lobby loading loading...");
        });
  }
}

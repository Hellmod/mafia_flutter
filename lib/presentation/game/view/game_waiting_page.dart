import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../utils/Wigets.dart';
import '../block/game_bloc.dart';

class GameWaitingPage extends StatefulWidget {
  const GameWaitingPage({Key? key}) : super(key: key);

  @override
  _GameWaitingPage createState() => _GameWaitingPage();
}

class _GameWaitingPage extends State<GameWaitingPage> {
  GameBloc? myBloc;
  late AnimationController controller;


  @override
  void initState() {
    super.initState();
    myBloc = context.read<GameBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
        bloc: myBloc,
        builder: (context, state) {
          if (state is GameWaitingForOthersActionsState) {
            return Container(
              width: double.infinity,
              color: const Color(0xff1e1e1e),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MainWidget.toolBar("Poczekaj na akcję wszystkich graczy"),
                    const Expanded(
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min, // To sprawi, że elementy będą razem
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(height: 24),
                            Text('Oczekiwanie na resztę graczy...',
                              style: TextStyle(color: Colors.white),),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );

          }
          return MainWidget.loadingWidget("Game wating loading...");
        });
  }

}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../utils/Wigets.dart';
import '../block/game_bloc.dart';

class GameFinishPage extends StatefulWidget {
  const GameFinishPage({Key? key}) : super(key: key);

  @override
  _GameFinishPage createState() => _GameFinishPage();
}

class _GameFinishPage extends State<GameFinishPage> {
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
          if (state is GameFinishedState) {
            return Container(
              width: double.infinity,
              color: const Color(0xff1e1e1e),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MainWidget.toolBar("Koniec gry:"),
                    Expanded(
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min, // To sprawi, że elementy będą razem
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (state.isMafiaWon)
                              const Text(
                                'Gra zakończyła się zwycięstwem Piratów!',
                                style: TextStyle(color: Colors.white),
                              )
                            else
                              const Text(
                                'Gra zakończyła się zwycięstwem Marynarzy!',
                                style: TextStyle(color: Colors.white),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );

          }
          return MainWidget.loadingWidget("Game finish page loading...");
        });
  }

}
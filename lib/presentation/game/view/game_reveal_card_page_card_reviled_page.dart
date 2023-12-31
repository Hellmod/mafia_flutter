import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafia/utils/character/Character.dart';

import '../../../utils/AppTextStyles.dart';
import '../../../utils/Utility.dart';
import '../../../utils/Wigets.dart';
import '../../../utils/character/Sailor.dart';
import '../block/game_bloc.dart';

class GameRevealCardReviled extends StatefulWidget {
  GameRevealCardReviled({Key? key}) : super(key: key);

  @override
  _GameRevealCardReviled createState() => _GameRevealCardReviled();
}

class _GameRevealCardReviled extends State<GameRevealCardReviled>
    with SingleTickerProviderStateMixin {
  GameBloc? myBloc;
  late AnimationController controller;

  String userNick = '';

  void startLoading() {
    controller.forward().then(
      (_) {
        if (controller.status == AnimationStatus.completed) {
          onLoadingComplete();
        }
      },
    );
  }

  void stopLoadingAndReset() {
    controller.stop();
    controller.reset();
  }

  void onLoadingComplete() {
    myBloc?.add(OnRevealCardClicked());
  }

  void onNextCLick() {
    myBloc?.add(OnRevealNextRevealCardClicked());
  }

  @override
  void initState() {
    super.initState();
    myBloc = context.read<GameBloc>();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
        bloc: myBloc,
        builder: (context, state) {
          if (state is GameRealCardState) {
            return Container(
              width: double.infinity,
              color: const Color(0xff1e1e1e),
              child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              MainWidget.toolBar(
                                  "Odsłoń kartę\n i poznaj swoją rolę w rozgrywce"),
                              const SizedBox(height: 40),
                              pageTitle(state.user.name),
                              const SizedBox(height: 24),
                              card(state.user.character ?? Sailor()),
                            ],
                          ),
                        ),
                      ),
                      MainWidget.orangeButton(
                          text: 'Dalej',
                          callback: () {
                            onNextCLick();
                          }),
                    ],
                  )),
            );
          }
          return const CircularProgressIndicator();
        });
  }

  Widget pageTitle(String userName) => Container(
        alignment: Alignment.center,
        width: double.infinity,
        child: Text(
          userName,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: 'Clash Display Variable',
            fontSize: 24,
            fontWeight: FontWeight.w600,
            height: 1.3,
            color: Color(0xffffffff),
          ),
        ),
      );

  Widget card(Character character) => AspectRatio(
        aspectRatio: 4 / 6,
        child: GestureDetector(
          onLongPressStart: (_) => startLoading(),
          onLongPressEnd: (_) => stopLoadingAndReset(),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFF1E1E1E),
              borderRadius: BorderRadius.circular(24.0),
              border: Border.all(
                color: Colors.white.withOpacity(0.2),
                width: 16.0,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(character.cardPath),
                    // Ścieżka do zasobu obrazu
                    fit: BoxFit
                        .cover, // Dopasowanie obrazu do rozmiarów kontenera
                  ),
                  color: Color(0xFF1E1E1E),
                  borderRadius: BorderRadius.circular(24.0),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.2),
                    width: 1.0,
                  ),
                ),
                child: const Stack(
                  fit: StackFit.expand,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // Dodano, aby rozłożyć dzieci równomiernie
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // Zmieniono na CrossAxisAlignment.start
                        children: [
                          Text(
                            'Mafia',
                            style: AppTextStyles.text_C_14_600,
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              'Mafia',
                              style: AppTextStyles.text_C_14_600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}

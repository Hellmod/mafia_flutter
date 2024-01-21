import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../utils/Wigets.dart';
import '../block/game_bloc.dart';

class GameRevealKilledPage extends StatefulWidget {
  const GameRevealKilledPage({Key? key}) : super(key: key);

  @override
  _GameRevealKilledPage createState() => _GameRevealKilledPage();
}

class _GameRevealKilledPage extends State<GameRevealKilledPage> {
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
        if (state is GameRevealKilledPersonState) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.usersThatChanged.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(state.usersThatChanged[index].name),
                    );
                  },
                ),
              ),
              MainWidget.orangeButton(
                  text: 'Dalej',
                  callback: () {
                    myBloc?.add(OnNextInKilledPageClicked());
                  }),
            ],
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}

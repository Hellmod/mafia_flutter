import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../models/User.dart';
import '../../../services/FirebaseGameService.dart';

part 'game_event.dart';

part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final FirebaseGameService _firebaseGameService;

  List<User> users = [];
  User? user;

  GameBloc(this._firebaseGameService) : super(GameInitialState()) {
    on<GameEvent>((event, emit) async {
      if (event is OnRevealCardClicked) {
        debugPrint("RMRM OnRevealCardClicked clicked!!!");
      }
    });

    _init();
  }

  Future<void> _init() async {
    users = await _firebaseGameService.getUsers();
    debugPrint("RMRM users: $users");
  }
}

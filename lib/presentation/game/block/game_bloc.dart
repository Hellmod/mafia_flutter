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

    on<OnRevealNextRevealCardClicked>((event, emit) async {
      emit(GameNightState(user: user!, users: users));
    });

    on<OnMakeActionClicked>((event, emit) async {
      debugPrint("RMRM OnMakeActionClicked clicked!!! ${event.user}");
    });

    _init();
  }

  Future<void> _init() async {
    users = await _firebaseGameService.getUsers();
    var deviceIdentifier = await _firebaseGameService.getDeviceIdentifier();
    user = users.firstWhere((element) => element.id == deviceIdentifier);
    debugPrint("RMRM5 user: $user");
    emit(GameRealCardState(user: user!));
  }
}

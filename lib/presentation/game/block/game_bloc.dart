import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../models/User.dart';
import '../../../services/FirebaseGameService.dart';
import '../../../utils/character/PlauerAction.dart';

part 'game_event.dart';

part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final FirebaseGameService _firebaseGameService;
  StreamSubscription? _playerActionsSubscription;

  List<User> users = [];
  User? user;
  int currentDayNightNumber = 0;
  List<ActionDetail> playerActions = [];
  String deviceIdentifier = "";

  GameBloc(this._firebaseGameService) : super(GameInitialState()) {
    on<GameEvent>((event, emit) async {
      if (event is OnRevealCardClicked) {}
    });

    on<OnRevealNextRevealCardClicked>((event, emit) async {
      emit(GameNightState(user: user!, users: users));
    });

    on<OnMakeActionClicked>((event, emit) async {
      makePlayerAction(event.user);
    });

    _init();
  }

  Future<void> _init() async {
    users = await _firebaseGameService.getUsers();
    deviceIdentifier = await _firebaseGameService.getDeviceIdentifier();
    currentDayNightNumber =
        await _firebaseGameService.getCurrentDayNightNumber();
    user = users.firstWhere((element) => element.id == deviceIdentifier);
    _initSteam();
    emit(GameRealCardState(user: user!));
  }

  Future<void> _initSteam() async {
    await _playerActionsSubscription?.cancel();
    debugPrint("RMRM _initSteam currentDayNightNumber= $currentDayNightNumber");
    _playerActionsSubscription =
        _firebaseGameService.streamPlayerActions(currentDayNightNumber).listen(
      (playerActionsUpdate) {
        playerActions = playerActionsUpdate;
        playerActions.forEach((element) {
          debugPrint("RMRM element.toString()" + element.toString());
        });
      },
      onError: (error) {
        debugPrint("Error listening to player actions: $error");
      },
    );
  }

  Future<void> makePlayerAction(User selectedUser) async {
    try {
      await _firebaseGameService.makePlayerAction(
        currentDayNightNumber.toString(),
        ActionDetail(
          idOwner: deviceIdentifier,
          idSelected: selectedUser.id,
        ),
      );
    } catch (e) {
      debugPrint("Error making player action: $e");
    }
  }
}

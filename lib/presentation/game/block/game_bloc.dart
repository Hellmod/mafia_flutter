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
    _playerActionsSubscription =
        _firebaseGameService.streamPlayerActions(currentDayNightNumber).listen(
      (playerActionsUpdate) {
        playerActions = playerActionsUpdate;
        if (isActionDone()) {
          emit(GameRevealKilledPersonState(usersThatChanged: calculateState()));
        }
      },
      onError: (error) {
        debugPrint("Error listening to player actions: $error");
      },
    );
  }

  List<User> calculateState() {
    var usersCopy = users.map((user) => user.clone()).toList();
    playerActions.forEach((action) {
      var characterOwner =
          users.firstWhere((element) => element.id == action.idOwner).character;
      characterOwner.makeSpecialAction(action.idSelected, users);
    });

    return getDifferenceBetweenLists(usersCopy, users);
  }

  List<User> getDifferenceBetweenLists(List<User> oldList, List<User> newList) {
    List<User> differences = [];

    newList.forEach((userFromNewList) {
      var userFromOldList =
          oldList.firstWhere((element) => element.id == userFromNewList.id);
      if (userFromNewList.isDead != userFromOldList.isDead) {
        differences.add(userFromNewList);
      }
    });

    return differences;
  }

  isActionDone() {
    int amountOfUsers = users.length;
    int amountOfActions = playerActions.length;
    if (amountOfActions == amountOfUsers) {
      return true;
    } else {
      return false;
    }
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
    emit(GameWaitingForOthersActionsState());
  }
}

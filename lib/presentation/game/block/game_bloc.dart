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
  List<User> usersState = [];
  User? user;
  int currentDayNightNumber = 1;
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

    on<OnNextInKilledPageClicked>((event, emit) async {
      debugPrint("RMRM OnNextInKilledPageClicked usersState: $usersState");
      if (currentDayNightNumber.isEven) {
        emit(GameDayState(
            user: user!,
            users:
            usersState.where((element) => element.isDead == false).toList()));
      } else {
        emit(GameNightState(
            user: user!,
            users:
            usersState.where((element) => element.isDead == false).toList()));
      }

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
    debugPrint("RMRM _initSteam currentDayNightNumber: $currentDayNightNumber");
    _playerActionsSubscription =
        _firebaseGameService.streamPlayerActions(currentDayNightNumber).listen(
      (playerActionsUpdate) {
        onActionChanged(playerActionsUpdate);
      },
      onError: (error) {
        debugPrint("Error listening to player actions: $error");
      },
    );
  }

  void onActionChanged(List<ActionDetail> newPlayerActions  ) {
    debugPrint("RMRM onActionChanged newPlayerActions: $newPlayerActions");
    playerActions = newPlayerActions;
    if (isActionDone()) {
      calculateState();
      emit(GameRevealKilledPersonState(usersThatChanged: usersState));
      currentDayNightNumber++;
      _initSteam();
    }
  }

  List<User> calculateState() {
    if (currentDayNightNumber.isEven) {
      return makeDayAction();
    } else {
      return makeNightAction();
    }
  }

  List<User> makeDayAction() {
    var idSelectedUser = findMostVoted(playerActions);
    usersState = usersState.map((user) {
      if (user.id == idSelectedUser) {
        user.isDead = true;
      }
      return user;
    }).toList();
    return usersState;
  }

  List<User> makeNightAction() {
    var usersCopy = users.map((user) => user.clone()).toList();
    playerActions.forEach((action) {
      var characterOwner =
          users.firstWhere((element) => element.id == action.idOwner).character;
      characterOwner.makeSpecialAction(action.idSelected, users);
    });
    usersState = users;//czemu tu nie ma usersCopy?

    return getDifferenceBetweenLists(usersCopy, users);
  }

  String? findMostVoted(List<ActionDetail> playerActions) {
    Map<String, int> voteCounts = {};

    // Zliczanie głosów
    for (var action in playerActions) {
      voteCounts[action.idSelected] = (voteCounts[action.idSelected] ?? 0) + 1;
    }

    // Sortowanie i sprawdzenie, czy jest jeden zwycięzca
    var sortedVotes = voteCounts.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    if (sortedVotes.length >= 2 &&
        sortedVotes[0].value == sortedVotes[1].value) {
      // Jeśli dwie osoby mają tę samą największą liczbę głosów, zwróć null
      return null;
    }

    return sortedVotes.isNotEmpty ? sortedVotes.first.key : null;
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

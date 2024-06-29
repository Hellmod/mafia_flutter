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
      emit(GameNightState(user: user!, users: usersState));
    });

    on<OnMakeActionClicked>((event, emit) async {
      savePlayerAction(event.user);
      emit(GameWaitingForOthersActionsState());
    });

    on<OnNextInKilledPageClicked>((event, emit) async {
      if (usersState.any((element) =>
          element.id == deviceIdentifier &&
          element.isDead == true)
      ) {
        emit(GameWaitingForOthersActionsState());
      } else if (currentDayNightNumber.isEven) {
        emit(GameDayState(
            user: user!,
            users: usersState
                .where((element) => element.isDead == false)
                .toList()));
      } else {
        emit(GameNightState(
            user: user!,
            users: usersState
                .where((element) => element.isDead == false)
                .toList()));
      }
    });

    _init();
  }

  Future<void> _init() async {
    users = await _firebaseGameService.getUsers();
    usersState = users;
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
        onActionChanged(playerActionsUpdate);
      },
      onError: (error) {
        debugPrint("Error listening to player actions: $error");
      },
    );
  }

  void onActionChanged(List<ActionDetail> newPlayerActions) {
    debugPrint(
        "RMRM log onActionChanged: $currentDayNightNumber  newPlayerActions: $newPlayerActions");
    playerActions = newPlayerActions;
    if (isActionDone()) {
      nextAction();
    }
  }

  void nextAction() {
    debugPrint("RMRM log makeAction usersState: $usersState before");
    var usersStateCopy = usersState.map((user) => user.clone()).toList();
    recalculateState();
    var killedUsers = getDifferenceBetweenLists(usersStateCopy, usersState);
    debugPrint("RMRM log makeAction usersState: $usersState after");
    debugPrint("RMRM log killedUsers: $killedUsers");

    if (_isGameFinished()) {
      debugPrint("RMRM log game finished");
      return;
    } else {
      currentDayNightNumber++;
      _playerActionsSubscription?.cancel(); //ToDo check if it is needed
      _initSteam();

      emit(GameRevealKilledPersonState(usersThatChanged: killedUsers));
    }
  }

  bool _isGameFinished() {
   // return false; //ToDo delete this line before release
    var amountOfAliveMafia = usersState
        .where(
            (element) => element.isDead == false && element.character.isMafia)
        .length;
    var amountOfAliveCitizens = usersState
        .where(
            (element) => element.isDead == false && !element.character.isMafia)
        .length;
    if (amountOfAliveMafia == 0) {
      emit(GameFinishedState(isMafiaWon: false));
      return true;
    } else if (amountOfAliveMafia >= amountOfAliveCitizens) {
      emit(GameFinishedState(isMafiaWon: true));
      return true;
    } else {
      return false;
    }
  }

  void recalculateState() {
    if (currentDayNightNumber.isEven) {
      makeDayAction();
    } else {
      makeNightAction();
    }
  }

  void makeDayAction() {
    var idSelectedUser = _findMostVoted(playerActions);
    if (idSelectedUser != null) {
      _killUser(idSelectedUser);
    }
  }

  void _killUser(String idSelectedUser) {
    usersState = usersState.map((user) {
      if (user.id == idSelectedUser) {
        user.isDead = true;
      }
      return user;
    }).toList();
  }

  void makeNightAction() {
    playerActions.forEach((action) {
      var characterOwner =
          users.firstWhere((element) => element.id == action.idOwner).character;
      if(characterOwner.name == "Pirat"){//ToDo make as enum
        var idSelectedUser = _findMostVotedForPirat(playerActions);
        if (idSelectedUser != null) {
          _killUser(idSelectedUser);
        }
      }
      else{
        usersState =
            characterOwner.makeSpecialAction(action.idSelected, usersState);
      }

    });
  }

  String? _findMostVotedForPirat(List<ActionDetail> playerActions) {
  Map<String, int> voteCounts = {};

  for (var action in playerActions) {
    var owner = users.firstWhere((element) => element.id == action.idOwner);
    if (owner.character.name == "Pirat") {
      voteCounts[action.idSelected] = (voteCounts[action.idSelected] ?? 0) + 1;
    }
  }

  var sortedVotes = voteCounts.entries.toList()
    ..sort((a, b) => b.value.compareTo(a.value));

  return sortedVotes.isNotEmpty ? sortedVotes.first.key : null;
}

  String? _findMostVoted(List<ActionDetail> playerActions) {
    Map<String, int> voteCounts = {};

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
    int amountOfAliveUsers =
        usersState.where((element) => element.isDead == false).toList().length;
    int amountOfActions = playerActions.length;
    if (amountOfActions == amountOfAliveUsers) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> savePlayerAction(User selectedUser) async {
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

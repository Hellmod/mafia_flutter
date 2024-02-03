import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/User.dart';
import '../../../services/LobbyService.dart';
import '../../../utils/Utility.dart';
import '../../../utils/character/Character.dart';
import '../../../utils/character/Unknown.dart';

part 'lobby_event.dart';

part 'lobby_state.dart';

class LobbyBloc
    extends Bloc<LobbyEvent, LobbyState> {
  final LobbyService _lobbyService;

  String roomId = "";
  bool isUserInGame = false;
  List<User> users = [];
  User user = User(name: '', id: '', character: Unknown());
  String deviceIdentifier = "";

  Map<Character, int> characterAmountMap = {};
  StreamSubscription? _usersSubscription;

  LobbyBloc(this._lobbyService) : super(LoadingState()) {
    on<LobbyEvent>((event, emit) async {
      if (event is OnSaveUserClick) {
        addUser(event.userName);
      } else if (event is OnNextInLobbyClick) {
        emit(LobbyManyPhoneCharacterChooseState(
            characters: [], charactersToChoose: users.length));
      } else if (event is OnRemoveUserClick) {
        removeUser();
      }
    });

    //-----

    on<OnLobbyUserListBackClick>((event, emit) async {
      emit(LobbyUserListState(
          users: users,
          user: user,
          isUserInGame: isUserInGame,
          roomId: roomId));
    });

    on<OnIncreaseAmountCharacterClick>((event, emit) async {
      incriseAmount(event.amount, event.character);
    });

    on<OnStartClick>((event, emit) async {
      onStartClick(event.amount, event.jakistekst);
    });

    _init();
  }

  Future<void> _init() async {
    print("RMRM1 init");
    deviceIdentifier = await _lobbyService.getDeviceIdentifier();
    print("RMRM2 init");
    isUserInGame = await checkIsYourIdIsInGame();
    print("RMRM3 init");
    if (await _lobbyService.isGameStarted()) {
      emit(NavigateToGamePageState(roomId));
      return;
    }
    debugPrint("RMRM deviceIdentifier: $deviceIdentifier, isUserInGame: $isUserInGame, users: $users, user: $user, roomId: $roomId");
    _usersSubscription?.cancel();
    _usersSubscription =
        _lobbyService.streamUsersFromGameRoom().listen((updatedUsers) {
          onUsersChanged(updatedUsers);
        });
    debugPrint("RMRM deviceIdentifier: $deviceIdentifier, isUserInGame: $isUserInGame, users: $users, user: $user, roomId: $roomId");
  }

  void onUsersChanged(List<User> updatedUsers) {
    debugPrint(
        "RMRM log users: $users  updatedUsers: $updatedUsers");
    users = updatedUsers;
    user = users.firstWhere((element) => element.id == deviceIdentifier);//RM Poprawić

    emit(LobbyUserListState(
        users: users, user: user, isUserInGame: isUserInGame, roomId: roomId));
  }

  int sumAmountOfCharacterMap() {
    return characterAmountMap.values.fold(0, (prev, element) => prev + element);
  }

  @override
  Future<void> close() {
    _usersSubscription?.cancel();
    return super.close();
  }

  Future<void> incriseAmount(int amount, Character character) async {
    characterAmountMap[character] = amount;
    emit(LobbyManyPhoneCharacterChooseState(
        characters: [],
        charactersToChoose: users.length - sumAmountOfCharacterMap()));
  }

  Future<void> onStartClick(int amount, String character) async {
    List<User> usersWitchCharacter = users;
    assignCharactersToUsersRandomly(usersWitchCharacter, characterAmountMap);
    _lobbyService.updateUsersWithCharacters(users);
    _lobbyService.startGame();
  }



  Future<void> addUser(String userName) async {
    if (deviceIdentifier == null) {
      Utility.somethingWentWrong();
      debugPrint("Error adding user: deviceIdentifier is null");
      return;
    }

    User user =
        User(name: userName, id: deviceIdentifier, character: Unknown());
    try {
      await _lobbyService.addUser(user);
    } catch (e) {
      debugPrint("Error adding user: $e");
      Utility.somethingWentWrong();
    }
  }

  Future<void> removeUser() async {
    try {
      await _lobbyService.removeUser(deviceIdentifier);
    } catch (e) {
      Utility.somethingWentWrong();
    }
  }

  Future<bool> checkIsYourIdIsInGame() async {
    return users.any((element) => element.id == deviceIdentifier);
  }

  void assignCharactersToUsersRandomly(
      List<User> users, Map<Character, int> characterAmountMap) {
    Random random = Random();
    List<Character> availableCharacters = [];

    characterAmountMap.forEach((character, amount) {
      for (int i = 0; i < amount; i++) {
        availableCharacters.add(character);
      }
    });

    availableCharacters.shuffle(random);

    for (User user in users) {
      if (availableCharacters.isNotEmpty) {
        user.character = availableCharacters.removeLast();
      } else {
        user.character = Unknown();
      }
    }
  }
}

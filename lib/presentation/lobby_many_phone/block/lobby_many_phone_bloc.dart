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

part 'lobby_many_phone_event.dart';

part 'lobby_many_phone_state.dart';

class LobbyManyPhoneBloc
    extends Bloc<LobbyManyPhoneEvent, LobbyManyPhoneState> {
  final LobbyService _firebaseService;

  String roomId = "";
  bool isUserInGame = false;
  bool isGameStarted = false;
  List<User> users = [];
  User user = User(name: '', id: '', character: Unknown());
  String deviceIdentifier = "";

  Map<Character, int> characterAmountMap = {};
  StreamSubscription? _usersSubscription;

  LobbyManyPhoneBloc(this._firebaseService) : super(Lobbynitial()) {
    on<LobbyManyPhoneEvent>((event, emit) async {
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

/*    on<TokenPageConnectClick>((event, emit) async {
      await connectToRoomIfExist(event.idRoom);
    });*/

    on<OnIncreaseAmountCharacterClick>((event, emit) async {
      incriseAmount(event.amount, event.character);
    });

    on<OnStartClick>((event, emit) async {
      onStartClick(event.amount, event.jakistekst);
    });

    _init();
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
    _firebaseService.updateUsersWithCharacters(users);
    _firebaseService.startGame();
  }

  Future<void> connectToRoomIfExist(String idRoom) async {
    loadRoom(idRoom);
  }

  Future<void> _init() async {
    deviceIdentifier = await _firebaseService.getDeviceIdentifier();
  }

  Future<void> loadRoom(String idRoom) async {
    print("RMRM1 loadRoom");
    isGameStarted = await _firebaseService.isGameStarted();
    print("RMRM2 loadRoom");
    isUserInGame = await checkIsYourIdIsInGame(users);
    print("RMRM3 loadRoom");

    debugPrint(
        "RMRM isGameStarted: $isGameStarted, isUserInGame: $isUserInGame, user: $user, users: $users, roomId: $idRoom");

    await _usersSubscription?.cancel();
    _usersSubscription =
        _firebaseService.streamUsersFromGameRoom().listen((updatedUsers) async {
      onUsersChanged(updatedUsers);
    });
  }

  Future<void> onUsersChanged(List<User> updatedUsers) async {
    users = updatedUsers;
    user = users.firstWhere((element) => element.id == deviceIdentifier);
    if (isUserInGame) {
      if (isGameStarted) {
        emit(NavigateToGamePageState(
          roomId,
        ));
        return;
      }
      emit(LobbyUserListState(
          users: updatedUsers,
          user: user,
          isUserInGame: isUserInGame,
          roomId: roomId));
    } else {
      emit(LobbyUserListState(
          users: updatedUsers,
          user: User(name: '', id: '', character: Unknown()),
          isUserInGame: isUserInGame,
          roomId: roomId));
    }
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
      await _firebaseService.addUser(user);
    } catch (e) {
      debugPrint("Error adding user: $e");
      Utility.somethingWentWrong();
    }
  }

  Future<void> removeUser() async {
    if (deviceIdentifier == null) {
      Utility.somethingWentWrong();
      return;
    }

    try {
      await _firebaseService.removeUser(deviceIdentifier);
    } catch (e) {
      Utility.somethingWentWrong();
    }
  }

  Future<bool> checkIsYourIdIsInGame(List<User> userList) async {
    if (deviceIdentifier == null) {
      Utility.somethingWentWrong();
      return false;
    }

    return userList.any((element) => element.id == deviceIdentifier);
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

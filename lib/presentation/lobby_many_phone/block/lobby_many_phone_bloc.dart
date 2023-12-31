import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafia/utils/character/Sailor.dart';
import 'package:meta/meta.dart';
import '../../../models/User.dart';
import '../../../services/FirebaseService.dart';
import '../../../utils/Utility.dart';
import '../../../utils/character/Character.dart';
import '../../../utils/character/Unknown.dart';

part 'lobby_many_phone_event.dart';

part 'lobby_many_phone_state.dart';

class LobbyManyPhoneBloc
    extends Bloc<LobbyManyPhoneEvent, LobbyManyPhoneState> {
  final FirebaseService _firebaseService;

  String? roomId;
  List<User> users = [];
  Map<Character, int> characterAmountMap = {};
  StreamSubscription? _usersSubscription;

  LobbyManyPhoneBloc(this._firebaseService) : super(LobbyManyPhoneInitial()) {
    on<LobbyManyPhoneEvent>((event, emit) async {
      if (event is OnNewGameClick) {
        createNewRoom();
      } else if (event is OnSaveUserClick) {
        addUser(event.userName);
      } else if (event is OnNextInLobbyClick) {
        emit(LobbyManyPhoneCharacterChooseState(
            characters: [], charactersToChoose: users.length));
      } else if (event is OnRemoveUserClick) {
        removeUser();
      }
    });

    on<CheckIdExists>((event, emit) async {
      await doesRoomExist(event.idRoom);
    });

    on<OnIncreaseAmountCharacterClick>((event, emit) async {
      incriseAmount(event.amount, event.character);
    });

    on<OnStartClick>((event, emit) async {
      onStartClick(event.amount, event.jakistekst);
    });
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
    _firebaseService.updateUsersWithCharacters(roomId!, users);
    _firebaseService.startGame(roomId!);
  }

  Future<void> doesRoomExist(String idRoom) async {
    bool isRoomExist = await _firebaseService.doesRoomExist(idRoom);
    roomId = idRoom;
    if (isRoomExist) {
      loadRoom(idRoom);
    } else {
      Utility.missingRoom();
    }
  }

  Future<void> createNewRoom() async {
    String roomId = await _firebaseService.createNewRoom();
    loadRoom(roomId);
  }

  Future<void> loadRoom(String idRoom) async {
    await _usersSubscription?.cancel();
    _usersSubscription = _firebaseService
        .streamUsersFromGameRoom(idRoom)
        .listen((updatedUsers) async {
      users = updatedUsers;

      bool isUserInGame = await checkIsYourIdIsInGame(updatedUsers);
      bool isGameStarted = await _firebaseService.isGameStarted(idRoom);
      if (isUserInGame) {
        if (isGameStarted) {
          //TUTAJ NAWIGUJ DO GAME
          emit(NavigateToGamePageState(
            idRoom,
          ));
          return;
        }
        String? deviceIdentifier = await getDeviceIdentifier();
        User user = updatedUsers
            .firstWhere((element) => element.id == deviceIdentifier);
        emit(LobbyManyPhoneUserListState(
            users: updatedUsers,
            user: user,
            isUserInGame: isUserInGame,
            roomId: idRoom));
      } else {
        emit(LobbyManyPhoneUserListState(
            users: updatedUsers,
            user: User(name: '', id: '', character: Unknown()),
            isUserInGame: isUserInGame,
            roomId: idRoom));
      }
    });
  }

  Future<void> addUser(String userName) async {
    LobbyManyPhoneUserListState _state = state as LobbyManyPhoneUserListState;
    String? deviceIdentifier = await getDeviceIdentifier();
    if (deviceIdentifier == null) {
      Utility.somethingWentWrong();
      return;
    }

    User user = User(name: userName, id: deviceIdentifier, character: Unknown());
    try {
      await _firebaseService.addUser(user, _state.roomId);
    } catch (e) {
      Utility.somethingWentWrong();
    }
  }

  Future<void> removeUser() async {
    LobbyManyPhoneUserListState _state = state as LobbyManyPhoneUserListState;
    String? deviceIdentifier = await getDeviceIdentifier();
    if (deviceIdentifier == null) {
      Utility.somethingWentWrong();
      return;
    }

    try {
      await _firebaseService.removeUser(deviceIdentifier, _state.roomId);
    } catch (e) {
      Utility.somethingWentWrong();
    }
  }

  Future<String?> getDeviceIdentifier() async {
    final deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      return androidInfo.id;
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      return iosInfo.identifierForVendor;
    }
    return 'unknown';
  }

  Future<bool> checkIsYourIdIsInGame(List<User> userList) async {
    String? deviceIdentifier = await getDeviceIdentifier();
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

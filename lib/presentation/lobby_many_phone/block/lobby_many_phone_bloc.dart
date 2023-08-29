import 'dart:ffi';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../models/User.dart';
import '../../../services/FirebaseService.dart';
import '../../../utils/Utility.dart';

part 'lobby_many_phone_event.dart';

part 'lobby_many_phone_state.dart';

class LobbyManyPhoneBloc
    extends Bloc<LobbyManyPhoneEvent, LobbyManyPhoneState> {
  final FirebaseService _firebaseService;

  LobbyManyPhoneBloc(this._firebaseService) : super(LobbyManyPhoneInitial()) {
    on<LobbyManyPhoneEvent>((event, emit) async {
      if (event is OnNewGameClick) {
        debugPrint("RMRM OnNewGameClick");
      } else if (event is OnSaveUserClick) {
        addUser(event.userName);
      } else if (event is OnRemoveUserClick) {
        removeUser();
      } else if (event is CheckIdExists) {
        await loadRoom(event.idgame);
      }
    });
  }

  Future<void> loadRoom(String idRoom) async {
    _firebaseService
        .streamUsersFromGameRoom(idRoom)
        .listen((updatedUsers) async {
      bool isUserInGame = await checkIsYourIdIsInGame(updatedUsers);
      if (isUserInGame) {
        String? deviceIdentifier = await getDeviceIdentifier();
        User user = updatedUsers
            .firstWhere((element) => element.id == deviceIdentifier);
        emit(LobbyManyPhoneUserListState(
            users: updatedUsers, user: user, isUserInGame: isUserInGame, roomId: idRoom));
      } else {
        emit(LobbyManyPhoneUserListState(
            users: updatedUsers,
            user: User(name: '', id: ''),
            isUserInGame: isUserInGame, roomId: idRoom));
      }
    });
  }

  Future<void> addUser(String userName) async {
    String? deviceIdentifier = await getDeviceIdentifier();
    if (deviceIdentifier == null) {
      Utility.somethingWentWrong();
      return;
    }

    User user = User(name: userName, id: deviceIdentifier);
    try {
      await _firebaseService.addUser(user);
    } catch (e) {
      Utility.somethingWentWrong();
    }
  }

  Future<void> removeUser() async {
    String? deviceIdentifier = await getDeviceIdentifier();
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
}

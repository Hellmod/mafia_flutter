import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../services/FirebaseService.dart';
import '../../../utils/Utility.dart';

part 'room_management_event.dart';

part 'room_management_state.dart';

class RoomManagementBloc
    extends Bloc<RoomManagementEvent, RoomManagementState> {
  final FirebaseService _firebaseService;

  RoomManagementBloc(this._firebaseService) : super(InitState()) {
    on<TokenPageConnectClick>((event, emit) async {
      await connectToRoomIfExist(event.idRoom);
    });

    on<OnNewGameClick>((event, emit) async {
      createNewRoom();
    });

    on<RestartBlock>((event, emit) async {
      restartBlock();
    });

  }

  void restartBlock() {
    emit(InitState());
  }

  Future<void> connectToRoomIfExist(String idRoom) async {
    bool isRoomExist = await _firebaseService.doesRoomExist(idRoom);
    if (isRoomExist) {
      navToLobbyManyPhone(idRoom);
    } else {
      Utility.missingRoom();
    }
  }

  Future<void> createNewRoom() async {
    String roomId = await _firebaseService.createNewRoom();
    navToLobbyManyPhone(roomId);
  }

  navToLobbyManyPhone(String roomId) {
    emit(NavToLobbyManyPhoneState(roomId: roomId));
  }
}

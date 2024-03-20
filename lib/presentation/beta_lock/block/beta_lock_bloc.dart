import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../utils/Utility.dart';
import 'BetaLockService.dart';

part 'beta_lock_event.dart';
part 'beta_lock_state.dart';

class BetaLockBloc
    extends Bloc<BetaLockEvent, BetaLockState> {
  final BetaLockService _firebaseService;

  BetaLockBloc(this._firebaseService) : super(InitState()) {
    on<CheckGameKeyClick>((event, emit) async {
      await checkIsGameKeyIsCorrect(event.gameKey);
    });

    on<RestartBlock>((event, emit) async {
      restartBlock();
    });

  }

  void restartBlock() {
    emit(InitState());
  }

  Future<void> checkIsGameKeyIsCorrect(String gameKey) async {
    bool isRoomExist = await _firebaseService.doesGameKeyIsCorrect(gameKey);
    if (isRoomExist) {
      navToLobbyManyPhone(gameKey);
    } else {
      Utility.gameKeyIncorrect();
    }
  }

  navToLobbyManyPhone(String roomId) {
    emit(NavToHomeState());
  }
}

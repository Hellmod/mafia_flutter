import 'dart:developer';
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
import '../../../utils/character/Character.dart';

part 'game_event.dart';

part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final FirebaseService _firebaseService;

  String? roomId;
  List<User> users = [];
  Map<Character, int> characterAmountMap = {};

  GameBloc(this._firebaseService) : super(GameInitialState()) {
    on<GameEvent>((event, emit) async {
      if (event is OnRevealCardClicked) {
        debugPrint("RMRM OnRevealCardClicked clicked!!!");
      }
    });
  }
}

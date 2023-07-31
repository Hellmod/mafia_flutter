import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'lobby_many_phone_event.dart';
part 'lobby_many_phone_state.dart';

class LobbyManyPhoneBloc extends Bloc<LobbyManyPhoneEvent, LobbyManyPhoneState> {
  LobbyManyPhoneBloc() : super(LobbyManyPhoneInitial()) {
    on<LobbyManyPhoneEvent>((event, emit) {
      if(event is OnNewGameClick) {

        debugPrint("RMRM1");
        emit(LobbyManyPhoneUserListState());
      }
    });
  }
}

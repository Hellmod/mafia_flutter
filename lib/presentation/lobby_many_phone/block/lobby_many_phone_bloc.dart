import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../models/User.dart';
import '../../../services/FirebaseService.dart';
part 'lobby_many_phone_event.dart';
part 'lobby_many_phone_state.dart';

class LobbyManyPhoneBloc extends Bloc<LobbyManyPhoneEvent, LobbyManyPhoneState> {
  final FirebaseService _firebaseService;  // dodane

  LobbyManyPhoneBloc(this._firebaseService) : super(LobbyManyPhoneInitial()) {
    on<LobbyManyPhoneEvent>((event, emit) async {
      if (event is OnNewGameClick) {
        debugPrint("RMRM1");
        //emit(LobbyManyPhoneUserListState());
      } else if (event is CheckIdExists) {
        await loadRoom(event.idgame); // zmiana na await, bo loadRoom jest asynchroniczne
      }
    });
  }

  Future<void> loadRoom(String idRoom) async {  // poprawka w definicji funkcji
    try {
      List<User> users = await _firebaseService.getUsersFromGameRoom(idRoom);
      if(users.isNotEmpty) {
        emit(LobbyManyPhoneUserListState(users: users));
        debugPrint("RMRM2 ${users}");
        //emit(LobbyManyPhoneUsersLoaded(users: users));
      } else {
        debugPrint("RMRM3");
        //emit(LobbyManyPhoneNoUsersFound());
      }
    } catch(e) {
      debugPrint("RMRM4");

      //emit(LobbyManyPhoneErrorState());
    }
  }
}

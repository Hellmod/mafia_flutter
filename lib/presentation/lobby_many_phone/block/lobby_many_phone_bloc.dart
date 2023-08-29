import 'package:bloc/bloc.dart';
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
      } else if (event is CheckIdExists) {
        await loadRoom(event.idgame);
      }
    });
  }

  Future<void> loadRoom(String idRoom) async {
    _firebaseService.streamUsersFromGameRoom(idRoom).listen((updatedUsers) {
      emit(LobbyManyPhoneUserListState(users: updatedUsers));
    });
  }

  Future<void> addUser(String userName) async {
    User user = User(name: userName, id: "id zalogowanego użytkownika"); //ToDo dodać id zalogowanego użytkownika
    try {
      await _firebaseService.addUser(user);
    } catch (e) {
      Utility.somethingWentWrong();
    }
  }
}

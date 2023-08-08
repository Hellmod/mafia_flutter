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
      } else if (event is CheckIdExists) {
        await loadRoom(event.idgame);
      }
    });
  }

  Future<void> loadRoom(String idRoom) async {  // poprawka w definicji funkcji
    _firebaseService.streamUsersFromGameRoom(idRoom).listen(
            (updatedUsers) {
          debugPrint("RMRM5 ${updatedUsers}");
          emit(LobbyManyPhoneUserListState(users: updatedUsers));
        });
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

part 'lobby_many_phone_event.dart';

part 'lobby_many_phone_state.dart';

class LobbyManyPhoneBloc
    extends Bloc<LobbyManyPhoneEvent, LobbyManyPhoneState> {
  final FirebaseFirestore _firestore;

  LobbyManyPhoneBloc(this._firestore) : super(LobbyManyPhoneInitial()) {
    on<LobbyManyPhoneEvent>((event, emit) async {
      // Zmienione na async, aby można było korzystać z funkcji asynchronicznych
      if (event is OnNewGameClick) {
        debugPrint("RMRM1");
        emit(LobbyManyPhoneUserListState());
      } else if (event is CheckIdExists) {
        String idRroom = event.idgame;

        try {
          DocumentSnapshot gameDoc =
              await _firestore.collection('rooms').doc(idRroom).get();

          if (gameDoc.exists) {
            debugPrint("RMRM2: ${gameDoc.data().toString()}");
/*            var userSnapshot = await _firestore
                .collection('rooms')
                .doc(idgame) // W tym miejscu powinieneś podać ID konkretnego pokoju, który Cię interesuje
                .collection('Users')
                .doc('1') // W tym miejscu powinieneś podać ID konkretnego użytkownika, który Cię interesuje
                .get();

            if(userSnapshot.exists) {
              print(userSnapshot.data()?['name']);
            } else {
              print('Dokument nie istnieje');
            }
            // Jeśli dokument istnieje, możemy go użyć.
            // Na przykład: emit(LobbyManyPhoneGameExistsState(gameDoc.data()));
          } else {
            debugPrint("RMRM3 ");
            // Jeśli dokument nie istnieje, możemy zrobić coś innego.
            // Na przykład: emit(LobbyManyPhoneGameDoesNotExistState());
          */
            var usersSnapshot = await _firestore
                .collection('rooms')
                .doc(idRroom) // W tym miejscu powinieneś podać ID konkretnego pokoju, który Cię interesuje
                .collection('Users')
                .get();

            usersSnapshot.docs.forEach((userDoc) {
              if (userDoc.exists) {
                print(userDoc.data()['name']);
                print(userDoc.data());
              } else {
                print('Dokument nie istnieje');
              }
            });
          }
        } catch (e) {
          debugPrint("RMRM4 $e");
          // Obsługa błędów z Firestore.
          // Na przykład: emit(LobbyManyPhoneErrorState(e));
        }
      }
    });
  }
}

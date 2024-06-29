

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:mafia/utils/Utility.dart';

import '../models/User.dart';

class LobbyService {
  final String gameId;
  final FirebaseFirestore _firebase = FirebaseFirestore.instance;

  LobbyService(this.gameId);

  Future<List<User>> getUsersFromGameRoom() async {
    try {
      QuerySnapshot querySnapshot = await _firebase
          .collection('rooms')
          .doc(gameId)
          .collection('users')
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        return querySnapshot.docs.map((doc) => User.fromDocument(doc)).toList();
      }

      return [];
    } catch (e) {
      throw Exception(e);
    }
  }

  Stream<List<User>> streamUsersFromGameRoom() {
    return _firebase
        .collection('rooms')
        .doc(gameId)
        .collection('users')
        .snapshots()
        .map((QuerySnapshot snapshot) =>
            snapshot.docs.map((doc) => User.fromDocument(doc)).toList());
  }

  Stream<bool> streamIsGameStarted() {
    return _firebase
        .collection('rooms')
        .doc(gameId)
        .snapshots()
        .map((DocumentSnapshot snapshot) {
      if (snapshot.exists && snapshot.data() != null) {
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
        return data['isGameStarted'] ?? false;
      } else {
        return false;
      }
    });
  }

  Future<void> addUser(User user) async {
    try {
      await _firebase
          .collection('rooms')
          .doc(gameId)
          .collection('users')
          .doc(user.id)
          .set(user.toMap());
    } catch (e) {
      debugPrint("Error adding user in Service: $e user: $user gameId: $gameId");
      Utility.somethingWentWrong();
      return;
    }
  }

  Future<void> removeUser(String userId) async {
    await FirebaseFirestore.instance
        .collection('rooms')
        .doc(gameId)
        .collection('users')
        .doc(userId)
        .delete();
  }

  Future<void> startGame() async {
    try {
      DocumentReference roomRef = _firebase.collection('rooms').doc(gameId);

      await roomRef.update({
        'isGameStarted': true,
      });
    } catch (e) {
      print("Błąd przy aktualizacji stanu gry: $e");
    }
  }

  Future<void> updateUsersWithCharacters(List<User> users) async {
    WriteBatch batch = _firebase.batch();

    for (User user in users) {
      DocumentReference userRef = _firebase
          .collection('rooms')
          .doc(gameId)
          .collection('users')
          .doc(user.id);

      batch.update(userRef, {'character': user.character.toMap()});
    }

    await batch.commit();
  }

  Future<bool> isGameStarted() async {
    try {
      DocumentSnapshot roomSnapshot = await _firebase.collection('rooms').doc(gameId).get();
      if (roomSnapshot.exists && roomSnapshot.data() != null) {
        Map<String, dynamic> roomData = roomSnapshot.data() as Map<String, dynamic>;
        return roomData['isGameStarted'] ?? false;
      }
      return false;
    } catch (e) {
      print("Błąd podczas sprawdzania, czy gra się rozpoczęła: $e");
      return false;
    }
  }

  String getGameId() {
    return gameId;
  }
}

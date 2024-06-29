
import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:mafia/utils/Utility.dart';

import '../models/User.dart';
import 'Utils.dart';

class FirebaseService {
  final FirebaseFirestore _firebase = FirebaseFirestore.instance;

  Future<List<User>> getUsersFromGameRoom(String gameId) async {
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

  Stream<List<User>> streamUsersFromGameRoom(String gameId) {
    return _firebase
        .collection('rooms')
        .doc(gameId)
        .collection('users')
        .snapshots()
        .map((QuerySnapshot snapshot) =>
            snapshot.docs.map((doc) => User.fromDocument(doc)).toList());
  }

  Future<void> addUser(User user, [String gameId = "123123"]) async {
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

  Future<void> removeUser(String userId, [String gameId = "123123"]) async {
    await FirebaseFirestore.instance
        .collection('rooms')
        .doc(gameId)
        .collection('users')
        .doc(userId)
        .delete();
  }

  Future<bool> doesRoomExist(String roomId) async {
    try {
      DocumentSnapshot roomSnapshot = await _firebase.collection('rooms').doc(roomId).get();
      return roomSnapshot.exists;
    } catch (e) {
      print("Error checking room existence: $e");
      return false;
    }
  }

  Future<String> createNewRoom() async {
    String roomId = _generateRoomId();
    bool roomExists = await doesRoomExist(roomId);
    while (roomExists) {
      roomId = _generateRoomId();
      roomExists = await doesRoomExist(roomId);
    }

    await _firebase.collection('rooms').doc(roomId).set({
      "createdOn": FieldValue.serverTimestamp(),
      "deviceId":  await getDeviceIdentifier(),
      "isGameStarted":  false,
    });
    return roomId;
  }

  Future<void> startGame(String roomId) async {
    try {
      DocumentReference roomRef = _firebase.collection('rooms').doc(roomId);

      await roomRef.update({
        'isGameStarted': true,
      });
    } catch (e) {
      print("Błąd przy aktualizacji stanu gry: $e");
    }
  }

  String _generateRoomId() {
    final random = Random();
    final values = List<int>.generate(6, (i) => random.nextInt(10));
    return values.join();
  }

  Future<void> updateUsersWithCharacters(String gameId, List<User> users) async {
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

  Future<bool> isGameStarted(String roomId) async {
    try {
      DocumentSnapshot roomSnapshot = await _firebase.collection('rooms').doc(roomId).get();
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

}

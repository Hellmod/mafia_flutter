import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/User.dart';
import '../utils/character/PlauerAction.dart';

class FirebaseGameService {
  final String gameId;
  final FirebaseFirestore _firebase = FirebaseFirestore.instance;

  FirebaseGameService(this.gameId);

  Future<List<User>> getUsers() async {
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

  Future<int> getCurrentDayNightNumber() async {
    try {
      QuerySnapshot querySnapshot = await _firebase
          .collection('rooms')
          .doc(gameId)
          .collection('player_actions')
          .orderBy('number', descending: true)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        int currentDayNightNumber = querySnapshot.docs.first.get('number');
        return currentDayNightNumber;
      }

      return 1;
    } catch (e) {
      throw Exception(e);
    }
  }

  Stream<List<ActionDetail>> streamPlayerActions(int roundNumber) {
    return _firebase
        .collection('rooms')
        .doc(gameId)
        .collection('player_actions')
        .doc(roundNumber.toString())
        .collection('actions')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => ActionDetail.fromDocument(doc))
            .toList());
  }

  Future<void> makePlayerAction(
      String roundNumber, ActionDetail actionDetail) async {
    try {
      DocumentReference actionRef = _firebase
          .collection('rooms')
          .doc(gameId)
          .collection('player_actions')
          .doc(roundNumber)
          .collection('actions')
          .doc(actionDetail.idOwner);

      await actionRef.set({
        'idOwner': actionDetail.idOwner,
        'idSelected': actionDetail.idSelected,
        'createdOn': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print("Błąd przy dodawaniu akcji: $e");
      throw Exception("Błąd przy dodawaniu akcji: $e");
    }
  }
}

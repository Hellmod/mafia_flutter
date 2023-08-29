
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/User.dart';

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
      print(e.toString());
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
}

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
        return querySnapshot.docs
            .map((doc) => User.fromDocument(doc))
            .toList();
      }

      return [];
    } catch (e) {
      throw Exception(e);
    }
  }

}

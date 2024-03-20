
import 'package:cloud_firestore/cloud_firestore.dart';

class BetaLockService {
  final FirebaseFirestore _firebase = FirebaseFirestore.instance;

  Future<bool> doesGameKeyIsCorrect(String gameKey) async {
    try {
     DocumentSnapshot roomSnapshot = await _firebase.collection('game_keys').doc(gameKey).get();
     return roomSnapshot.exists;
    } catch (e) {
      print("Error checking room existence: $e");
      return false;
    }
  }
}

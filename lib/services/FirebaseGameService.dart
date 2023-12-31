import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/User.dart';

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

  Future<String?> getDeviceIdentifier() async {
    final deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      return androidInfo.id;
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      return iosInfo.identifierForVendor;
    }
    return 'unknown';
  }

  Future<int> getCurrentDayNightNumber() async {
    try {
      QuerySnapshot querySnapshot = await _firebase
          .collection('rooms')
          .doc(gameId)
          .collection('player_actions')
          .orderBy('number', descending: true) // Sortowanie w odwrotnej kolejności
          .limit(1) // Pobranie tylko jednego dokumentu
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        int currentDayNightNumber = querySnapshot.docs.first.get('number');
        return currentDayNightNumber;
      }

      return 0; // Domyślna wartość, jeśli kolekcja jest pusta
    } catch (e) {
      throw Exception(e);
    }
  }
}

import 'package:mafia/models/User.dart';

import 'Pirates.dart';
import 'Sailor.dart';

abstract class Character {
  String get name;
  bool get wakeInNight;
  bool get isEvil;
  double get priority;
  String get instruction;
  String get cardPath;
  String get team;
  int get rarity;
  String get description;

  List<User> makeSpecialAction(String idSelectedUsers, List<User> users);

  toMap() {
    return {
      'name': name,
    };
  }

  static Character fromMap(Map<String, dynamic> data) {
    String name = data['name'] ?? 'Unknown';

    switch (name) {
      case "Pirat":
        return Pirates();
      case "Marynarz":
        return Sailor();
      default:
        throw Exception('Unknown character type: $name');
    }
  }
}

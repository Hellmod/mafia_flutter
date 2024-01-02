import 'package:flutter/foundation.dart';

import 'Character.dart'; // Jeśli chcesz używać logów w stylu Fluttera.

class Unknown extends Character {

  @override
  String get name => "Unknown";
  @override
  bool get wakeInNight => false;
  @override
  bool get isEvil => false;
  @override
  double get priority => 1.0;
  @override
  String get instruction => "Unknown";
  @override
  String get cardPath => "assets/images/character_sailor.png";
  @override
  String get description => "Unknown";
  @override
  int get rarity => 3;
  @override
  String get team => "Unknown";

  @override
  bool makeSpecialAction(List<int> idSelectedUsers) {
    return false;
  }

  void killPlayer(int userId) async {
  //  await initDatabase.updateIsPlayerDead(userId, true);
  }
}


import 'package:flutter/foundation.dart';

import 'Character.dart'; // Jeśli chcesz używać logów w stylu Fluttera.

class Pirates extends Character {

  @override
  String get name => "Pirat";
  @override
  bool get wakeInNight => true;
  @override
  bool get isEvil => true;
  @override
  double get priority => 1.0;
  @override
  String get instruction => "Wybierz gracza, którego chcesz zabić.";
  @override
  String get cardPath => "assets/images/character_sailor.png";
  @override
  String get description => "Zły Pirat";
  @override
  int get rarity => 2;
  @override
  String get team => "Mafia";

  @override
  bool makeSpecialAction(List<int> idSelectedUsers) {
    debugPrint("RMRM $name makeSpecialAction() called with: idSelectedUsers = $idSelectedUsers");
    if (idSelectedUsers.length > 1) return false;
    if (idSelectedUsers.isEmpty) return false;
    killPlayer(idSelectedUsers[0]);
    return true;
  }

  void killPlayer(int userId) async {
    //await initDatabase.updateIsPlayerDead(userId, true);
  }
}
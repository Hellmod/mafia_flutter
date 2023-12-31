import 'package:flutter/foundation.dart';

import 'Character.dart'; // Jeśli chcesz używać logów w stylu Fluttera.

class Sailor extends Character {

  @override
  String get name => "Marynarz";
  @override
  bool get wakeInNight => false;
  @override
  bool get isEvil => false;
  @override
  double get priority => 1.0;
  @override
  String get instruction => "Marynarz nie ma specjalnej akcji. Wybierz osobę z okularami";
  @override
  String get cardPath => "assets/images/character_sailor.png";
  @override
  String get description => "Sobry marynarz";
  @override
  int get rarity => 3;
  @override
  String get team => "Miasto";

  @override
  bool makeSpecialAction(List<int> idSelectedUsers) {
    debugPrint("RMRM $name makeSpecialAction() called with: idSelectedUsers = $idSelectedUsers");
    return false;
  }

  void killPlayer(int userId) async {
  //  await initDatabase.updateIsPlayerDead(userId, true);
  }
}


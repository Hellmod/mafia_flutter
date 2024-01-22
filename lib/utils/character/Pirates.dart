import 'package:flutter/foundation.dart';

import '../../models/User.dart';
import 'Character.dart'; // Jeśli chcesz używać logów w stylu Fluttera.

class Pirates extends Character {

  @override
  String get name => "Pirat";
  @override
  bool get wakeInNight => true;
  @override
  bool get isMafia => true;
  @override
  double get priority => 1.0;
  @override
  String get instruction => "Wybierz gracza, którego chcesz zabić.";
  @override
  String get cardPath => "assets/images/character_pirates.png";
  @override
  String get description => "Zły Pirat";
  @override
  int get rarity => 2;
  @override
  String get team => "Mafia";

  @override
  List<User> makeSpecialAction(String idSelectedUsers, List<User> users) {
    users.forEach((user) {
      if (user.id == idSelectedUsers) {
        user.isDead = true;
      }
    });
    return users;
  }
}
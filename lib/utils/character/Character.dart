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

  bool makeSpecialAction(List<int> idSelectedUsers);
}

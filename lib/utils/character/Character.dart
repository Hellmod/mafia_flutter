abstract class Character {
  String get name;
  bool get wakeInNight;
  bool get isEvil;
  double get priority;
  String get instruction;

  bool makeSpecialAction(List<int> idSelectedUsers);
}

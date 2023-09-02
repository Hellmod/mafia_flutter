import 'Character.dart';
import 'Pirates.dart';
import 'Sailor.dart';

class CharacterRepository {
  // Prywatny konstruktor, żeby nie można było stworzyć nowego obiektu
  // za pomocą konstruktora.
  CharacterRepository._privateConstructor();

  // Statyczna zmienna przechowująca instancję singletonu.
  static final CharacterRepository _instance = CharacterRepository._privateConstructor();

  // Publiczny dostęp do instancji singletonu.
  static CharacterRepository get instance => _instance;

  // Lista obiektów Character.
  List<Character> characters = [
    Pirates(),
    Pirates(),
    Pirates(),
    Pirates(),
    Pirates(),
    Sailor(),
  ];

  // Funkcja dostępu do listy znaków.
  List<Character> getCharacters() => characters;
}

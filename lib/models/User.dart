import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:equatable/equatable.dart';
import 'package:mafia/utils/character/Character.dart';
import '../utils/character/Unknown.dart';

class User extends Equatable {
  final String name;
  final String id;
  Character character;
  bool isDead = false;

  User({required this.name, required this.id, required this.character, this.isDead  = false});

  factory User.fromDocument(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return User(
      name: data['name'] ?? '',
      id: data['id'] ?? '',
      character: data['character'] != null
          ? Character.fromMap(data['character'])
          : Unknown(),
      isDead: false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'character': character.toMap(),
    };
  }

  @override //RM czy tu nie powinno być[name, id, character]
  List<Object> get props => [name, id];

  @override
  String toString() {
    return 'User(name: $name, isDead: $isDead)';
  }

  User clone() {
    return User(id: this.id, isDead: this.isDead, character: this.character, name: this.name);
  }
}

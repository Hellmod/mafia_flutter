import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:equatable/equatable.dart';
import 'package:mafia/utils/character/Character.dart';

class User extends Equatable {
  final String name;
  final String id;
  Character? character;

  User({required this.name, required this.id, this.character});

  factory User.fromDocument(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return User(
      name: data['name'] ?? '',
      id: data['id'] ?? '',
      character: data['character'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'character': character,
    };
  }

  @override//RM czy tu nie powinno być[name, id, character]
  List<Object> get props => [name, id];

  @override
  String toString() {
    return 'User(name: $name, id: $id, character: ${character?.toString() ?? "None"})';
  }
}

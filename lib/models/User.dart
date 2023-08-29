import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;
  final String id;

  User({required this.name, required this.id});

  factory User.fromDocument(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return User(
        name: data['name'] ?? '',
        id: data['id'] ?? ''
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  @override
  List<Object> get props => [name, id];
}
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;
  final String email;

  User({required this.name, required this.email});

  factory User.fromDocument(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return User(
        name: data['name'] ?? '',
        email: data['email'] ?? ''
    );
  }

  @override
  List<Object> get props => [name, email];
}
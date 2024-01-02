import 'package:cloud_firestore/cloud_firestore.dart';

class PlayerAction {
  final String id;
  final DateTime createdOn;
  final int number;

  PlayerAction({
    required this.id,
    required this.createdOn,
    required this.number,
  });

  factory PlayerAction.fromDocument(DocumentSnapshot doc) {
    var data = doc.data() as Map<String, dynamic>;
    return PlayerAction(
      id: doc.id,
      createdOn: (data['createdOn'] as Timestamp).toDate(),
      number: data['number'],
    );
  }

  @override
  String toString() {
    return 'PlayerAction(id: $id, createdOn: $createdOn, number: $number)';
  }
}

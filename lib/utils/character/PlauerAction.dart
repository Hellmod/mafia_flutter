import 'package:cloud_firestore/cloud_firestore.dart';

class ActionDetail {
  final String idOwner;
  final String idSelected;

  ActionDetail({
    required this.idOwner,
    required this.idSelected,
  });

  factory ActionDetail.fromDocument(DocumentSnapshot doc) {
    var data = doc.data() as Map<String, dynamic>;
    return ActionDetail(
      idOwner: data['idOwner'],
      idSelected: data['idSelected'],
    );
  }


  @override
  String toString() {
    return 'ActionDetail(idOwner: $idOwner, idSelected: $idSelected)';
  }
}

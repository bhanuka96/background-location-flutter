import 'package:cloud_firestore/cloud_firestore.dart';

class Service {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<UserModel> getUser(String uid) {
    return _db.collection('users').doc(uid).snapshots().map((event) => UserModel.fromFireStore(event));
  }
}

class UserModel {
  final String docId, name;

  UserModel({this.docId, this.name});

  factory UserModel.fromFireStore(DocumentSnapshot doc) {
    Map data = doc.data();

    return UserModel(docId: doc.id, name: data['name'] ?? '');
  }
}

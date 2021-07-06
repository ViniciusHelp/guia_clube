import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  Users({this.email, this.name, this.password, this.id, this.confirmPass});

//  Users.fromDocument(DocumentSnapshot document){
//     id = document.id;
//     name = document.data();
//     email = document.data()['email'] as String;
//   }

  String id;
  String password;
  String email;
  String name;
  String confirmPass;

  DocumentReference get firestoreRef =>
      FirebaseFirestore.instance.doc('users/$id');

  Future<void> saveData() async {
    await firestoreRef.set(toMap());
  }

  Map<String, dynamic> toMap() {
    return {'name': name,
      'email': email
      };
  }
}

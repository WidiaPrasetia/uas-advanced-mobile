import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {
  static CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  static Future<void> createOrUpdateUsers(String id,
      {String nama, String email}) async {
    await users.doc(id).set({'nama': nama, 'email': email});
  }
}

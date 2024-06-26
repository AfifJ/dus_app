import 'package:dus_app/models/contact_person.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Auth {
  static Future<User?> register({
    required String email,
    required String password,
    required String nama,
    required String noHp,
  }) async {
    User? user;
    try {
      user = (await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user;
      if (user != null) {
        CollectionReference usersCol =
            FirebaseFirestore.instance.collection('users');
        usersCol.doc(user.uid).set(
          {
            'email': email,
            'nama': nama,
            'phoneNumber': noHp,
          },
        );
      }
    } on FirebaseAuthException catch (e) {
      e.toString();
    }
    return user;
  }

  static Future<bool> login({
    required String email,
    required String password,
  }) async {
    bool value = false;

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      value = true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        e.toString();
      }
    }
    return value;
  }

  static Future<ContactPerson> getDataPerson(String id) async {
    final docData =
        await FirebaseFirestore.instance.collection('users').doc(id).get();
    final data = docData.data()!;
    return ContactPerson(
      name: data['nama'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
    );
  }

  static Stream<DocumentSnapshot<Map<String, dynamic>>> getUser() {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .snapshots();
  }
}

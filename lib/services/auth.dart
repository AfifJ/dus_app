import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Auth {
  static Future<User?> register({
    required String email,
    required String password,
    required String nama,
  }) async {
    User? user;
    try {
      user = (await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: email, password: password))
          .user;
      if (user != null) {
        CollectionReference usersCol =
            FirebaseFirestore.instance.collection('users');
        usersCol.doc(user.uid).set({'email': email, 'nama': nama});
      }
    } on FirebaseAuthException catch (e) {
      print(e.code);
    }
    return user;
  }

  static Future<User?> login({
    required String email,
    required String password,
  }) async {
    User? user;

    try {
      user = (await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password))
          .user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('user not found!');
      }
    }
    return user;
  }
}

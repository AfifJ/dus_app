import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Transaction{

  static Future<String> addData()async {
    CollectionReference data = FirebaseFirestore.instance.collection('data');
    User? user = FirebaseAuth.instance.currentUser;
    if(user != null){
      print(user.uid);
    }else{
      print('tidak ada');
    }
    return 'abc';
  }

}
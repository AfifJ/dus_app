import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dus_app/models/contact_person.dart';
import 'package:dus_app/models/data_address.dart';
import 'package:dus_app/models/data_history.dart';
import 'package:dus_app/models/data_transaction.dart';
import 'package:dus_app/models/item_transaction.dart';
import 'package:dus_app/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';

class DataSampah {
  static Future<String> createData() async {
    DateTime date = DateTime.now();
    CollectionReference data = FirebaseFirestore.instance.collection('data');
    User user = FirebaseAuth.instance.currentUser!;

    String formatDate = DateFormat(
      'ddMMyyyy_hhmmss',
    ).format(
      date,
    );

    String id = '${user.uid}_$formatDate';
    ContactPerson cp = await Auth.getDataPerson(user.uid);

    DataTransaction newData = DataTransaction(
      id: id,
      imageUrl: '',
      ownerId: user.uid,
      status: 0,
      items: [],
      pickupAddress: DataAddress(
        province: '',
        city: '',
        district: '',
        subDistrict: '',
        village: '',
        details: '',
      ),
      pickupSchedule: DateTime.now(),
      contact: cp,
    );
    data.doc(id).set(newData.toMap());
    return id;
  }

  static Stream<DocumentSnapshot<Map<String, dynamic>>> getDetail({
    required String id,
  }) {
    return FirebaseFirestore.instance.collection('data').doc(id).snapshots();
  }

  static DataTransaction getDetailData({
    required Map<String, dynamic> data,
  }) {
    return DataTransaction(
      id: data['id'],
      imageUrl: data['imageUrl'] ?? '',
      ownerId: data['ownerId'] ?? '',
      status: data['status'] ?? 0,
      items: (data['items'] as List)
          .map(
            (item) => ItemTransaction.fromMap(item),
          )
          .toList(),
      pickupAddress: DataAddress.fromMap(data['pickUpAddress']),
      pickupSchedule: (data['pickupSchedule'] as Timestamp).toDate(),
      contact: ContactPerson.fromMap(data['contact']),
    );
  }

  static Future<String> uploadImage({
    required File data,
    required String id,
  }) async {
    String url = '';
    final storage =
        FirebaseStorage.instance.ref().child('sampahImages/$id.jpg');
    await storage.putFile(data);
    url = await storage.getDownloadURL();
    return url;
  }

  static void updateData({
    required String id,
    required Map<String, dynamic> dataEdit,
  }) {
    FirebaseFirestore.instance.collection('data').doc(id).update(dataEdit);
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getDraft() {
    return FirebaseFirestore.instance
        .collection('data')
        .where('status', isEqualTo: 0)
        .where('ownerId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots();
  }

  static List<DataTransaction> getDraftData({
    required List<QueryDocumentSnapshot> draft,
  }) {
    return draft
        .map(
          (e) => DataTransaction(
            id: e.id,
            imageUrl: e['imageUrl'] ?? '',
            ownerId: e['ownerId'] ?? '',
            status: e['status'] ?? 0,
            items: (e['items'] as List)
                .map(
                  (item) => ItemTransaction.fromMap(item),
                )
                .toList(),
            pickupAddress: DataAddress.fromMap(e['pickUpAddress']),
            pickupSchedule: (e['pickupSchedule'] as Timestamp).toDate(),
            contact: ContactPerson.fromMap(e['contact']),
          ),
        )
        .toList();
  }

  static Future<void> deleteDraft(
    List<DataTransaction> draft,
  ) async {
    for (var v in draft) {
      if (v.imageUrl.isNotEmpty) {
        await FirebaseStorage.instance
            .ref()
            .child('sampahImages/${v.id}.jpg')
            .delete();
      }
      await FirebaseFirestore.instance.collection('data').doc(v.id).delete();
    }
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getRiwayat() {
    return FirebaseFirestore.instance
        .collection('data')
        .where('status', isEqualTo: 1)
        .where('ownerId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots();
  }

  static List<DataHistory> getRiwayatData({
    required List<QueryDocumentSnapshot>? data,
  }) {
    List<DataHistory> history = [];
    if (data != null) {
      for (var e in data) {
        String date = DateFormat(
          'dd MMMM yyyy',
        ).format(
          (e['pickupSchedule'] as Timestamp).toDate(),
        );
        if (history.isEmpty) {
          history.add(
            DataHistory(
              date: date,
              data: [
                DataTransaction(
                  id: e.id,
                  imageUrl: e['imageUrl'] ?? '',
                  ownerId: e['ownerId'] ?? '',
                  status: e['status'] ?? 0,
                  items: (e['items'] as List)
                      .map(
                        (item) => ItemTransaction.fromMap(item),
                      )
                      .toList(),
                  pickupAddress: DataAddress.fromMap(e['pickUpAddress']),
                  pickupSchedule: (e['pickupSchedule'] as Timestamp).toDate(),
                  contact: ContactPerson.fromMap(e['contact']),
                ),
              ],
            ),
          );
        } else if (history.last.date == date) {
          history.last.data.add(
            DataTransaction(
              id: e.id,
              imageUrl: e['imageUrl'] ?? '',
              ownerId: e['ownerId'] ?? '',
              status: e['status'] ?? 0,
              items: (e['items'] as List)
                  .map(
                    (item) => ItemTransaction.fromMap(item),
                  )
                  .toList(),
              pickupAddress: DataAddress.fromMap(e['pickUpAddress']),
              pickupSchedule: (e['pickupSchedule'] as Timestamp).toDate(),
              contact: ContactPerson.fromMap(e['contact']),
            ),
          );
        } else {
          history.add(
            DataHistory(
              date: date,
              data: [
                DataTransaction(
                  id: e.id,
                  imageUrl: e['imageUrl'] ?? '',
                  ownerId: e['ownerId'] ?? '',
                  status: e['status'] ?? 0,
                  items: (e['items'] as List)
                      .map(
                        (item) => ItemTransaction.fromMap(item),
                      )
                      .toList(),
                  pickupAddress: DataAddress.fromMap(e['pickUpAddress']),
                  pickupSchedule: (e['pickupSchedule'] as Timestamp).toDate(),
                  contact: ContactPerson.fromMap(e['contact']),
                ),
              ],
            ),
          );
        }
      }
    }
    return history;
  }
}

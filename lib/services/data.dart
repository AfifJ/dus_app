import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dus_app/models/contact_person.dart';
import 'package:dus_app/models/data_address.dart';
import 'package:dus_app/models/data_transaction.dart';
import 'package:dus_app/models/item_transaction.dart';
import 'package:intl/intl.dart';

class DataSampah {
  static Future<String> createData() async {
    DateTime date = DateTime.now();
    CollectionReference data = FirebaseFirestore.instance.collection('data');

    String formatDate = DateFormat(
      'ddMMyyyy_hhmmss',
    ).format(
      date,
    );

    DataTransaction newData = DataTransaction(
      id: formatDate,
      imageUrl: '',
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
      contact: ContactPerson(
        name: '',
        phoneNumber: '',
      ),
    );
    data.doc(formatDate).set(newData.toMap());
    return formatDate;
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
      await FirebaseFirestore.instance.collection('data').doc(v.id).delete();
    }
  }
}

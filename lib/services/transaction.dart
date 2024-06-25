import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dus_app/models/contact_person.dart';
import 'package:dus_app/models/data_address.dart';
import 'package:dus_app/models/data_transaction.dart';
import 'package:dus_app/models/item_transaction.dart';
import 'package:intl/intl.dart';

class Transaction {
  static Future<String> addData() async {
    DateTime date = DateTime.now();
    CollectionReference data = FirebaseFirestore.instance.collection('data');
    //User? user = FirebaseAuth.instance.currentUser;

    String formatDate = DateFormat(
      'ddMMyyyy_hhmmss',
    ).format(
      date,
    );

    DataTransaction newData = DataTransaction(
      id: formatDate,
      imageUrl: '',
      status: 0,
      recyclableItems: [],
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

  static Future<DataTransaction> getDetailData(String id) async {
    DocumentSnapshot doc =
        await FirebaseFirestore.instance.collection('data').doc(id).get();
    Map data = doc.data() as Map<String, dynamic>;

    return DataTransaction(
      id: doc.id,
      imageUrl: data['imageUrl'] ?? '',
      status: data['status'] ?? 0,
      recyclableItems: (data['items'] as List)
          .map(
            (item) => ItemTransaction.fromMap(item),
          )
          .toList(),
      pickupAddress: DataAddress.fromMap(data['pickupAddress']),
      pickupSchedule: (data['pickupSchedule'] as Timestamp).toDate(),
      contact: ContactPerson.fromMap(data['contact']),
    );
  }
}

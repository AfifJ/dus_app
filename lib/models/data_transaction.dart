import 'package:dus_app/models/contact_person.dart';
import 'package:dus_app/models/data_address.dart';
import 'package:dus_app/models/item_transaction.dart';

class DataTransaction {
  final String id;
  final String imageUrl;
  final int status;
  final List<ItemTransaction> items;
  final DataAddress pickupAddress;
  DateTime pickupSchedule;
  final ContactPerson contact;

  DataTransaction({
    required this.id,
    required this.imageUrl,
    required this.status,
    required this.items,
    required this.pickupAddress,
    required this.pickupSchedule,
    required this.contact,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      'status': status,
      'items': items,
      'pickUpAddress': pickupAddress.toMap(),
      'pickupSchedule': pickupSchedule,
      'contact': contact.toMap(),
    };
  }
}

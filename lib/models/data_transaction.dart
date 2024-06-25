import 'package:dus_app/models/contact_person.dart';
import 'package:dus_app/models/data_address.dart';
import 'package:dus_app/models/item_transaction.dart';

class DataTransaction {
  final String id;
  final String imageUrl;
  final int status;
  final List<ItemTransaction> recyclableItems;
  final DataAddress pickupAddress;
  final DateTime pickupSchedule;
  final ContactPerson contact;

  DataTransaction({
    required this.id,
    required this.imageUrl,
    required this.status,
    required this.recyclableItems,
    required this.pickupAddress,
    required this.pickupSchedule,
    required this.contact,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      'status': status,
      'items': recyclableItems.map((item) => item.toMap()).toList(),
      'pickUpAddress': pickupAddress.toMap(),
      'pickupSchedule': pickupSchedule,
      'contact': contact.toMap(),
    };
  }
}

import 'package:dus_app/models/contact_person.dart';
import 'package:dus_app/models/data_address.dart';
import 'package:dus_app/models/item_transaction.dart';

class DataTransaction{
  final String id;
  final String imageUrl;
  final List<ItemTransaction> recyclableItems;
  final DataAddress pickupAddress;
  final DateTime pickupSchedule;
  final ContactPerson contact;

  DataTransaction({
    required this.id,
    required this.imageUrl,
    required this.recyclableItems,
    required this.pickupAddress,
    required this.pickupSchedule,
    required this.contact,
  });

}
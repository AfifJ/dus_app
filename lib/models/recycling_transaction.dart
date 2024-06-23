import 'package:cloud_firestore/cloud_firestore.dart';

// NOTE: belum dipake

class RecyclingTransaction {
  final String id;
  final String imageUrl;
  final List<RecyclableItem> recyclableItems;
  final Address pickupAddress;
  final DateTime pickupSchedule;
  final ContactPerson contact;

  RecyclingTransaction({
    required this.id,
    required this.imageUrl,
    required this.recyclableItems,
    required this.pickupAddress,
    required this.pickupSchedule,
    required this.contact,
  });

  factory RecyclingTransaction.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return RecyclingTransaction(
      id: doc.id,
      imageUrl: data['imageUrl'] ?? '',
      recyclableItems: (data['recyclableItems'] as List)
          .map((item) => RecyclableItem.fromMap(item))
          .toList(),
      pickupAddress: Address.fromMap(data['pickupAddress']),
      pickupSchedule: (data['pickupSchedule'] as Timestamp).toDate(),
      contact: ContactPerson.fromMap(data['contact']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'recyclableItems': recyclableItems.map((item) => item.toMap()).toList(),
      'pickupAddress': pickupAddress.toMap(),
      'pickupSchedule': Timestamp.fromDate(pickupSchedule),
      'contact': contact.toMap(),
    };
  }
}

class RecyclableItem {
  final String type;
  final double weight;
  final double pricePerKg;

  RecyclableItem({
    required this.type,
    required this.weight,
    required this.pricePerKg,
  });

  factory RecyclableItem.fromMap(Map<String, dynamic> map) {
    return RecyclableItem(
      type: map['type'],
      weight: map['weight'].toDouble(),
      pricePerKg: map['pricePerKg'].toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'weight': weight,
      'pricePerKg': pricePerKg,
    };
  }
}

class Address {
  final String province;
  final String city;
  final String district;
  final String subDistrict;
  final String village;
  final String details;
  final GeoPoint? coordinates;

  Address({
    required this.province,
    required this.city,
    required this.district,
    required this.subDistrict,
    required this.village,
    required this.details,
    this.coordinates,
  });

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      province: map['province'],
      city: map['city'],
      district: map['district'],
      subDistrict: map['subDistrict'],
      village: map['village'],
      details: map['details'],
      coordinates: map['coordinates'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'province': province,
      'city': city,
      'district': district,
      'subDistrict': subDistrict,
      'village': village,
      'details': details,
      'coordinates': coordinates,
    };
  }
}

class ContactPerson {
  final String name;
  final String phoneNumber;

  ContactPerson({
    required this.name,
    required this.phoneNumber,
  });

  factory ContactPerson.fromMap(Map<String, dynamic> map) {
    return ContactPerson(
      name: map['name'],
      phoneNumber: map['phoneNumber'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
    };
  }
}
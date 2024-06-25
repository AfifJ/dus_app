import 'package:cloud_firestore/cloud_firestore.dart';

class DataAddress {
  final String province;
  final String city;
  final String district;
  final String subDistrict;
  final String village;
  final String details;
  final GeoPoint? coordinates;

  DataAddress({
    required this.province,
    required this.city,
    required this.district,
    required this.subDistrict,
    required this.village,
    required this.details,
    this.coordinates,
  });

  factory DataAddress.fromMap(Map<String, dynamic> map) {
    return DataAddress(
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

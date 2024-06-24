import 'package:cloud_firestore/cloud_firestore.dart';

class DataAddress{
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
}
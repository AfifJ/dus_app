import 'package:dus_app/models/data_transaction.dart';

class DataHistory {
  final String date;
  List<DataTransaction> data;

  DataHistory({
    required this.date,
    required this.data,
  });
}

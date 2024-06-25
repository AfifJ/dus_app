class ItemTransaction {
  final String type;
  final double weight;
  final double pricePerKg;

  ItemTransaction({
    required this.type,
    required this.weight,
    required this.pricePerKg,
  });

  factory ItemTransaction.fromMap(Map<String, dynamic> map) {
    return ItemTransaction(
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

class ItemTransaction {
  final String name;
  final String type;
  double weight;
  final double pricePerKg;

  ItemTransaction({
    required this.name,
    required this.type,
    required this.weight,
    required this.pricePerKg,
  });

  factory ItemTransaction.fromMap(Map<String, dynamic> map) {
    return ItemTransaction(
      name: map['name'],
      type: map['type'],
      weight: map['weight'].toDouble(),
      pricePerKg: map['pricePerKg'].toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'type': type,
      'weight': weight,
      'pricePerKg': pricePerKg,
    };
  }
}

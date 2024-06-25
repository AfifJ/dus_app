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

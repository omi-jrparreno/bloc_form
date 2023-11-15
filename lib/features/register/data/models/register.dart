import 'dart:convert';

class Register {
  final String firstName;
  final String lastName;
  final int age;
  final String address;

  Register({
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.address,
  });

  Register copyWith({
    String? firstName,
    String? lastName,
    int? age,
    String? address,
  }) {
    return Register(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      age: age ?? this.age,
      address: address ?? this.address,
    );
  }

  factory Register.empty() {
    return Register(
      address: '',
      age: -1,
      firstName: '',
      lastName: '',
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'firstName': firstName});
    result.addAll({'lastName': lastName});
    result.addAll({'age': age});
    result.addAll({'address': address});

    return result;
  }

  factory Register.fromMap(Map<String, dynamic> map) {
    return Register(
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      age: map['age']?.toInt() ?? 0,
      address: map['address'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Register.fromJson(String source) =>
      Register.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Register(firstName: $firstName, lastName: $lastName, age: $age, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Register &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.age == age &&
        other.address == address;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
        lastName.hashCode ^
        age.hashCode ^
        address.hashCode;
  }
}

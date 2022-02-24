import 'dart:convert';

class User {
  final String userName;
  final String password;
  final int id;
  User({
    required this.userName,
    required this.password,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'password': password,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userName: json['userName'],
      password: json['password'],
      id: json['id'],
    );
  }

  String toJson() => json.encode(toMap());

  //factory User.fromJson(String source) => User.fromMap(json.decode(source));

  User copyWith({
    String? userName,
    String? password,
    int? id,
  }) {
    return User(
      userName: userName ?? this.userName,
      password: password ?? this.password,
      id: id ?? this.id,
    );
  }
}

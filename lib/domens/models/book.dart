import 'dart:convert';

class Comments {
  final String body;
  final int id;
  Comments({
    required this.body,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'body': body,
      'id': id,
    };
  }

  factory Comments.fromJson(Map<String, dynamic> json) {
    return Comments(
      body: json['body'] ,
      id: json['id'],
    );
  }

  String toJson() => json.encode(toMap());

  //factory Book.fromJson(String source) => Book.fromMap(json.decode(source));
}

// To parse this JSON data, do
//
//     final library = libraryFromJson(jsonString);

import 'dart:convert';

List<Library> libraryFromJson(dynamic str) =>
    List<Library>.from(json.decode(str).map((x) => Library.fromJson(x)));

String libraryToJson(List<Library> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Library {
  int? id;
  String? categoryTitle;
  int? position;

  Library({
    this.id,
    this.categoryTitle,
    this.position,
  });

  factory Library.fromJson(Map<String, dynamic> json) => Library(
        id: json["id"] as int,
        categoryTitle: json["category_title"] as String,
        position: json["position"] as int,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "category_title": categoryTitle,
        "position": position,
      };
}

class Data {
  final int id;
  final String categoryTitle;
  final int position;
  Data({
    required this.id,
    required this.categoryTitle,
    required this.position,
  });
  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        categoryTitle: json["category_title"],
        position: json["position"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_title": categoryTitle,
        "position": position,
      };
}
import 'dart:convert';

Category2 category2FromJson(String str) => Category2.fromJson(json.decode(str));

String category2ToJson(Category2 data) => json.encode(data.toJson());

class Category2 {
  Category2({
    this.data,
  });

  List<Datum>? data;

  factory Category2.fromJson(Map<String, dynamic> json) => Category2(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.category,
  });

  int? id;
  String? category;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
      };
}

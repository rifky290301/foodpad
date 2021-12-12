// To parse this JSON data, do
//
//     final recipe2Result = recipe2ResultFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Recipe2Result recipe2ResultFromJson(String str) =>
    Recipe2Result.fromJson(json.decode(str));

String recipe2ResultToJson(Recipe2Result data) => json.encode(data.toJson());

class Recipe2Result {
  Recipe2Result({
    this.data,
  });

  List<Datum>? data;

  factory Recipe2Result.fromJson(Map<String, dynamic> json) => Recipe2Result(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.thumbnail,
    this.duration,
    this.level,
    this.rating,
  });

  int? id;
  String? name;
  String? thumbnail;
  int? duration;
  String? level;
  String? rating;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        thumbnail: json["thumbnail"],
        duration: json["duration"],
        level: json["level"],
        rating: json["rating"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "thumbnail": thumbnail,
        "duration": duration,
        "level": level,
        "rating": rating,
      };
}

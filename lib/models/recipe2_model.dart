import 'dart:convert';

Recipe2Result recipe2ResultFromJson(String str) =>
    Recipe2Result.fromJson(json.decode(str));

String recipe2ResultToJson(Recipe2Result data) => json.encode(data.toJson());

class Recipe2Result {
  Recipe2Result({
    required this.data,
  });

  final List<Datum> data;

  factory Recipe2Result.fromJson(Map<String, dynamic> json) => Recipe2Result(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.thumbnail,
    required this.duration,
    required this.level,
    required this.rating,
  });

  final int id;
  final String name;
  final String thumbnail;
  final int duration;
  final String level;
  final String rating;

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

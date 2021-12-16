// To parse this JSON data, do
//
//     final checkReport = checkReportFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CheckReport checkReportFromJson(String str) =>
    CheckReport.fromJson(json.decode(str));

String checkReportToJson(CheckReport data) => json.encode(data.toJson());

class CheckReport {
  CheckReport({
    required this.report,
  });

  final List<Report> report;

  factory CheckReport.fromJson(Map<String, dynamic> json) => CheckReport(
        report:
            List<Report>.from(json["report"].map((x) => Report.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "report": List<dynamic>.from(report.map((x) => x.toJson())),
      };
}

class Report {
  Report({
    required this.id,
    required this.report,
    required this.userId,
    required this.recipeId,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String report;
  final int userId;
  final int recipeId;
  final dynamic createdAt;
  final dynamic updatedAt;

  factory Report.fromJson(Map<String, dynamic> json) => Report(
        id: json["id"],
        report: json["report"],
        userId: json["user_id"],
        recipeId: json["recipe_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "report": report,
        "user_id": userId,
        "recipe_id": recipeId,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

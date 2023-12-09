import 'dart:convert';

class TaskModel {
  String title;
  String subtitle;
  String createdAt;
  bool isDone;

  TaskModel({
    required this.title,
    required this.subtitle,
    required this.createdAt,
    required this.isDone,
  });

  factory TaskModel.fromRawJson(String str) =>
      TaskModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        title: json["title"],
        subtitle: json["subtitle"],
        createdAt: json["created_at"],
        isDone: json["is_done"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
        "created_at": createdAt,
        "is_done": isDone,
      };
}

import 'dart:convert';

class NotificationModel {
  String id;
  String title;
  String body;

  NotificationModel({
    required this.id,
    required this.title,
    required this.body,
  });

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      id: map['id'].toString(),
      title: map['title'].toString(),
      body: map['body'].toString(),
    );
  }

  factory NotificationModel.fromJson(String source) =>
      NotificationModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class NotificationModel {
  final String image;
  final String title;
  final String body;
  final String timestamp;

  NotificationModel({
    required this.image,
    required this.title,
    required this.body,
    required this.timestamp,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      image: json['image'] ?? '',
      title: json['title'] ?? '',
      body: json['body'] ?? '',
      timestamp: json['timestamp'] ?? '',
    );
  }
}

// Parsing function to run in isolate
List<NotificationModel> parseNotifications(String responseBody) {
  final List<dynamic> parsed = jsonDecode(responseBody);
  return parsed
      .map<NotificationModel>((json) => NotificationModel.fromJson(json))
      .toList();
}

// Fetch and parse with isolate
Future<List<NotificationModel>> fetchNotifications() async {
  final response = await http.get(
    Uri.parse(
      'https://raw.githubusercontent.com/sayanp23/test-api/main/test-notifications.json',
    ),
  );

  if (response.statusCode == 200) {
    // Use compute to run parsing off main thread
    return compute(parseNotifications, response.body);
  } else {
    throw Exception('Failed to load notifications');
  }
}

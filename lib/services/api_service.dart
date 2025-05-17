import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/notification_model.dart';

class ApiService {
  static const String url =
      'https://raw.githubusercontent.com/sayanp23/test-api/main/test-notifications.json';

  static Future<List<NotificationModel>> fetchNotifications() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return compute(parseNotifications, response.body);
    } else {
      throw Exception('Failed to load notifications');
    }
  }

  // Optional and now corrected
  static List<NotificationModel> parseNotifications(String responseBody) {
    final List<dynamic> parsed = json.decode(responseBody);
    return parsed
        .map<NotificationModel>(
          (json) => NotificationModel.fromJson(json as Map<String, dynamic>),
        )
        .toList();
  }
}

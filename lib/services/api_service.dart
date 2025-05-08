import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
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

  static List<NotificationModel> parseNotifications(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<NotificationModel>((json) => NotificationModel.fromJson(json))
        .toList();
  }
}

import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/notification_model.dart';

class ApiService {
  static const String url =
      'https://raw.githubusercontent.com/sayanp23/test-api/main/test-notifications.json';

  static Future<List<NotificationModel>> fetchNotifications() async {
    try {
      final response = await http.get(Uri.parse(url));

      switch (response.statusCode) {
        case 200:
          return compute(parseNotifications, response.body);

        case 400:
          throw Exception('Bad request (400)');

        case 401:
          throw Exception('Unauthorized access (401)');

        case 403:
          throw Exception('Forbidden (403)');

        case 404:
          throw Exception('Data not found (404)');

        case 500:
          throw Exception('Server error (500)');

        default:
          throw Exception(
            'Unexpected error: ${response.statusCode} - ${response.reasonPhrase}',
          );
      }
    } on SocketException {
      throw Exception('No Internet connection.');
    } on HttpException {
      throw Exception('Could not find the resource.');
    } on FormatException {
      throw Exception('Bad response format.');
    } catch (e) {
      throw Exception('Unexpected error: ${e.toString()}');
    }
  }

  static List<NotificationModel> parseNotifications(String responseBody) {
    final List<dynamic> parsed = json.decode(responseBody);
    return parsed
        .map<NotificationModel>(
          (json) => NotificationModel.fromJson(json as Map<String, dynamic>),
        )
        .toList();
  }
}

import 'package:bw1_flutter_assignment/models/notification_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('NotificationModel JSON parsing', () {
    test('fromJson parses fields correctly', () {
      final json = {
        "image": "https://example.com/image.png",
        "title": "Test Title",
        "body": "Test body",
        "timestamp": "2025-05-16T12:00:00Z",
      };

      final notification = NotificationModel.fromJson(json);

      expect(notification.image, "https://example.com/image.png");
      expect(notification.title, "Test Title");
      expect(notification.body, "Test body");
      expect(notification.timestamp, "2025-05-16T12:00:00Z");
    });

    test('parseNotifications parses list of notifications', () {
      final jsonString = '''
      [
        {
          "image": "https://example.com/image1.png",
          "title": "Title 1",
          "body": "Body 1",
          "timestamp": "2025-05-15T10:00:00Z"
        },
        {
          "image": "https://example.com/image2.png",
          "title": "Title 2",
          "body": "Body 2",
          "timestamp": "2025-05-16T11:00:00Z"
        }
      ]
      ''';

      final notifications = parseNotifications(jsonString);
      expect(notifications.length, 2);
      expect(notifications[0].title, "Title 1");
      expect(notifications[1].timestamp, "2025-05-16T11:00:00Z");
    });
  });
}

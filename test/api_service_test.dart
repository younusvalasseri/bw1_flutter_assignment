import 'package:bw1_flutter_assignment/services/api_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Fetch notifications returns list', () async {
    final notifications = await ApiService.fetchNotifications();
    expect(notifications, isNotEmpty);
  });
}

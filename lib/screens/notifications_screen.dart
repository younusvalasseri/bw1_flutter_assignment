import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/notification_model.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notifications")),
      body: FutureBuilder<List<NotificationModel>>(
        future: ApiService.fetchNotifications(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
          final data = snapshot.data!;
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final item = data[index];
              return ListTile(
                leading: Image.asset(
                  'assets/${item.image}',
                  width: 40,
                  height: 40,
                  errorBuilder:
                      (context, error, stackTrace) =>
                          const Icon(Icons.notifications),
                ),
                title: Text(item.title),
                subtitle: Text(item.body),
                trailing: Text(item.timestamp.split('T').first),
              );
            },
          );
        },
      ),
    );
  }
}

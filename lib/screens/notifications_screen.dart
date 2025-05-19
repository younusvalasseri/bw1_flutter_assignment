import 'package:bw1_flutter_assignment/widgets/colors.dart';
import 'package:bw1_flutter_assignment/widgets/notification_appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../services/api_service.dart';
import '../models/notification_model.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //App bar with title and back icon
      appBar: const NotificationAppBar(),
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
          //Listview of notifications
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final item = data[index];
              return ListTile(
                //leading icon
                leading: Image.asset(
                  'assets/${item.image}',
                  width: 40,
                  height: 40,
                  errorBuilder:
                      (context, error, stackTrace) =>
                          const Icon(Icons.notifications),
                ),
                //title of each notification
                title: Text(
                  item.title,
                  style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                      color: kMidBlack,
                    ),
                  ),
                ),
                //Details of each notifications
                subtitle: Text(
                  '${item.body}\n${timeago.format(DateTime.parse(item.timestamp))}',
                ),
              );
            },
          );
        },
      ),
    );
  }
}

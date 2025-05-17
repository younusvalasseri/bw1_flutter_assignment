import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/account_page.dart';
import '../screens/notifications_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String account = '/account';
  static const String notifications = '/notifications';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case account:
        return MaterialPageRoute(builder: (_) => const AccountPage());
      case notifications:
        return MaterialPageRoute(builder: (_) => const NotificationsScreen());
      default:
        return MaterialPageRoute(
          builder:
              (_) =>
                  const Scaffold(body: Center(child: Text('Page not found'))),
        );
    }
  }
}

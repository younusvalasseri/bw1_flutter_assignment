// lib/widgets/notification_appbar.dart

import 'package:bw1_flutter_assignment/widgets/colors.dart';
import 'package:flutter/material.dart';

class NotificationAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final VoidCallback? onBack;

  const NotificationAppBar({super.key, this.onBack});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kWhitColor,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: InkWell(
          onTap: onBack ?? () => Navigator.pop(context),
          borderRadius: BorderRadius.circular(50),
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(
              color: kGreenColor,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.arrow_back, color: kWhitColor, size: 30),
          ),
        ),
      ),
      title: const Text(
        "Notifications",
        style: TextStyle(color: kBlack, fontWeight: FontWeight.w600),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

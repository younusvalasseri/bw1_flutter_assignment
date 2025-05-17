import 'package:bw1_flutter_assignment/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:badges/badges.dart' as badges;

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(6),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for products/stores',
                suffixIcon: Icon(LucideIcons.search, color: Color(0xFF3CE27E)),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.all(12),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        badges.Badge(
          badgeContent: const Text(
            '2',
            style: TextStyle(color: Colors.white, fontSize: 10),
          ),
          position: badges.BadgePosition.topEnd(top: 3, end: 6),
          child: IconButton(
            icon: const Icon(
              Icons.notifications_none_outlined,
              color: Colors.red,
            ),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.notifications);
            },
          ),
        ),
        IconButton(
          icon: const Icon(Icons.local_offer_outlined, color: Colors.orange),
          onPressed: () {},
        ),
      ],
    );
  }
}

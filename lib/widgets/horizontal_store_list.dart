import 'package:bw1_flutter_assignment/widgets/trending_card.dart';
import 'package:flutter/material.dart';

class HorizontalStoreList extends StatelessWidget {
  const HorizontalStoreList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 16),
        itemCount: 3,
        itemBuilder: (context, index) {
          return TrendingCard(iconPath: "assets/ice_cream.png");
        },
      ),
    );
  }
}

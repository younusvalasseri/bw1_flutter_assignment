import 'package:bw1_flutter_assignment/widgets/store_card.dart';
import 'package:flutter/material.dart';

class VerticalStoreList extends StatelessWidget {
  const VerticalStoreList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: 2,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: StoreCard(iconPath: "assets/ice_cream.png"),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'category_tile.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      crossAxisSpacing: 10,
      mainAxisSpacing: 20,
      childAspectRatio: .65,
      children: const [
        CategoryTile(
          title: "Food Delivery",
          iconPath: "assets/food_delivery.png",
          discount: "10% Off",
        ),
        CategoryTile(
          title: "Medicines",
          iconPath: "assets/medicine.png",
          discount: "10% Off",
        ),
        CategoryTile(
          title: "Pet Supplies",
          iconPath: "assets/pet_supplies.png",
          discount: "10% Off",
        ),
        CategoryTile(title: "Gifts", iconPath: "assets/gifts.png"),
        CategoryTile(title: "Meat", iconPath: "assets/meat.png"),
        CategoryTile(title: "Cosmetic", iconPath: "assets/cosmetic.png"),
        CategoryTile(title: "Stationery", iconPath: "assets/stationery.png"),
        CategoryTile(
          title: "Stores",
          iconPath: "assets/stores.png",
          discount: "10% Off",
        ),
      ],
    );
  }
}

import 'package:bw1_flutter_assignment/screens/notifications_screen.dart';
import 'package:bw1_flutter_assignment/widgets/category_tile.dart';
import 'package:bw1_flutter_assignment/widgets/horizontal_store_list.dart';
import 'package:bw1_flutter_assignment/widgets/promo_banner.dart';
import 'package:bw1_flutter_assignment/widgets/section_title.dart';
import 'package:bw1_flutter_assignment/widgets/vertical_store_list.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            const Icon(Icons.location_on, color: Colors.green),
            const SizedBox(width: 5),
            const Text(
              "ABCD, New Delhi",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Icon(Icons.keyboard_arrow_down, color: Colors.black),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.local_offer_outlined, color: Colors.orange),
            onPressed: () {},
          ),
          badges.Badge(
            badgeContent: const Text(
              '2',
              style: TextStyle(color: Colors.white),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.notifications_none_outlined,
                color: Colors.red,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const NotificationsScreen(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for products/stores',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "What would you like to do today?",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            GridView.count(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                CategoryTile(
                  title: "Food Delivery",
                  iconPath: "assets/food_delivery.png",
                  discount: "15%",
                ),
                CategoryTile(
                  title: "Medicines",
                  iconPath: "assets/medicine.png",
                  discount: "10%",
                ),
                CategoryTile(
                  title: "Pet Supplies",
                  iconPath: "assets/pet_supplies.png",
                  discount: "10%",
                ),
                CategoryTile(title: "Gifts", iconPath: "assets/gifts.png"),
                CategoryTile(title: "Meat", iconPath: "assets/meat.png"),
                CategoryTile(
                  title: "Cosmetic",
                  iconPath: "assets/cosmetic.png",
                ),
                CategoryTile(
                  title: "Stationery",
                  iconPath: "assets/stationery.png",
                ),
                CategoryTile(
                  title: "Stores",
                  iconPath: "assets/stores.png",
                  discount: "10%",
                ),
              ],
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                "More",
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            PromoBanner(
              title: "DISCOUNT\n25% ALL FRUITS",
              buttonText: "CHECK NOW",
              color: Colors.green.shade400,
            ),
            SectionTitle(title: "Trending"),
            HorizontalStoreList(),
            PromoBanner(
              title: "Customer favourite\ntop supermarkets",
              buttonText: "Explore",
              color: Colors.black,
            ),
            PromoBanner(
              title: "Refer & Earn\nInvite your friends & earn 15% off",
              buttonText: "",
              color: Colors.green,
            ),
            SectionTitle(title: "Nearby stores"),
            VerticalStoreList(),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text("View all stores"),
              ),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.storefront), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'My Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}

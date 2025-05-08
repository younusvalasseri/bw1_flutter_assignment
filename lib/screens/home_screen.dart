import 'package:bw1_flutter_assignment/screens/notifications_screen.dart';
import 'package:bw1_flutter_assignment/widgets/category_tile.dart';
import 'package:bw1_flutter_assignment/widgets/promo_banner.dart';
import 'package:bw1_flutter_assignment/widgets/section_title.dart';
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
                CategoryTile(title: "Food Delivery"),
                CategoryTile(title: "Medicines"),
                CategoryTile(title: "Pet Supplies"),
                CategoryTile(title: "Gifts"),
                CategoryTile(title: "Meat"),
                CategoryTile(title: "Cosmetic"),
                CategoryTile(title: "Stationery"),
                CategoryTile(title: "Stores"),
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
            _horizontalStoreList(),
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
            _verticalStoreList(),
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

  Widget _horizontalStoreList() {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 16),
        itemCount: 3,
        itemBuilder: (context, index) {
          return _storeCard();
        },
      ),
    );
  }

  Widget _verticalStoreList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: 2,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: _storeCard(),
        );
      },
    );
  }

  Widget _storeCard() {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(10),
      ),
      width: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                color: Colors.grey[300],
                child: const Icon(Icons.image),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Mithas Bhandar",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Sweets, North Indian",
                      style: TextStyle(fontSize: 12),
                    ),
                    Text("6.4 kms | 45 mins", style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: const [
              Icon(Icons.star, color: Colors.orange, size: 16),
              SizedBox(width: 5),
              Text("4.1", style: TextStyle(fontSize: 12)),
              Spacer(),
              Text(
                "45 mins",
                style: TextStyle(fontSize: 12, color: Colors.orange),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

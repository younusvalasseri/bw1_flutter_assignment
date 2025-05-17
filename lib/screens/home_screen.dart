import 'package:bw1_flutter_assignment/routes/app_routes.dart';
import 'package:bw1_flutter_assignment/widgets/category_tile.dart';
import 'package:bw1_flutter_assignment/widgets/craze_deals.dart';
import 'package:bw1_flutter_assignment/widgets/horizontal_store_list.dart';
import 'package:bw1_flutter_assignment/widgets/location_provider.dart';
import 'package:bw1_flutter_assignment/widgets/nearby_stores.dart';
import 'package:bw1_flutter_assignment/widgets/promo_banner.dart';
import 'package:bw1_flutter_assignment/widgets/refer_earn.dart';
import 'package:bw1_flutter_assignment/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationAsyncValue = ref.watch(locationProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const Icon(Icons.location_on, color: Color(0xFF3CE27E)),
            const SizedBox(width: 5),

            locationAsyncValue.when(
              data:
                  (location) => Text(
                    location,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              loading:
                  () => const Text(
                    "Fetching location...",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
              error:
                  (err, _) => const Text(
                    "Location error",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
            ),
            IconButton(
              icon: const Icon(
                Icons.keyboard_arrow_down_outlined,
                color: Color(0xFF3CE27E),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200], // Light grey background
                        borderRadius: BorderRadius.circular(6), // Small curve
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search for products/stores',
                          suffixIcon: Icon(
                            LucideIcons.search,
                            color: Color(0xFF3CE27E),
                          ),
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
                    icon: const Icon(
                      Icons.local_offer_outlined,
                      color: Colors.orange,
                    ),
                    onPressed: () {},
                  ),
                ],
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
              mainAxisSpacing: 20,
              childAspectRatio: .65,
              children: [
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
                  discount: "10% Off  ",
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
                  discount: "10% Off",
                ),
              ],
            ),
            const SizedBox(height: 10),
            Center(
              child: GestureDetector(
                onTap: () {
                  // Navigate to more categories screen or expand list
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      "More",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_outlined,
                      size: 24,
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Top picks for you",
                style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            PromoBanner(
              title: "DISCOUNT\n25% ALL\nFRUITS",
              buttonText: "CHECK NOW",
              color: Colors.green.shade400,
              imagePath: "assets/fruit_Ice_cream.png",
            ),

            SectionTitle(title: "Trending"),
            HorizontalStoreList(),
            HorizontalStoreList(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Craze deals",
                style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  CrazeDealsCard(
                    title: "Customer favourite\ntop supermarkets",
                    imagePath:
                        "assets/vegitables.png", // Use your uploaded asset here
                    onTap: () {
                      // Add your action here
                    },
                  ),
                  CrazeDealsCard(
                    title: "Exciting pet\naccessories",
                    imagePath: "assets/vegitables.png",
                    onTap: () {},
                  ),
                ],
              ),
            ),
            ReferEarnCard(
              onTap: () {
                // Navigate to referral screen or show dialog
              },
              imagePath: "assets/refer_gift.png",
            ),
            SectionTitle(title: "Nearby stores"),
            NearbyStoreCard(
              imagePath: 'assets/bread.png',
              storeName: 'Freshly Baker',
              cuisine: 'Sweets, North Indian',
              address: 'Site No - 1',
              distanceKm: 6.4,
              rating: 4.1,
              deliveryTime: '45 mins',
              badgeLabel: 'Top Store',
              promoText: 'Upto 10% OFF',
              itemsText: '3400+ items available',
            ),

            NearbyStoreCard(
              imagePath: 'assets/bread.png',
              storeName: 'Freshly Baker',
              cuisine: 'Sweets, North Indian',
              address: 'Site No - 1',
              distanceKm: 6.4,
              rating: 4.1,
              deliveryTime: '45 mins',
              badgeLabel: 'Top Store',
              promoText: 'Upto 10% OFF',
              itemsText: '3400+ items available',
            ),
            const SizedBox(height: 10),
            Center(
              child: TextButton(
                onPressed: () {
                  // Your action here
                },
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFF3CE27E),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 100,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'View all stores',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 3) {
            Navigator.pushNamed(context, AppRoutes.account);
          }
          // You can handle other index navigations here as needed
        },
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

import 'package:bw1_flutter_assignment/widgets/bottom_navigation_bar.dart';
import 'package:bw1_flutter_assignment/widgets/category_grid.dart';
import 'package:bw1_flutter_assignment/widgets/colors.dart';
import 'package:bw1_flutter_assignment/widgets/craze_deals.dart';
import 'package:bw1_flutter_assignment/widgets/home_search_bar.dart';
import 'package:bw1_flutter_assignment/widgets/horizontal_store_list.dart';
import 'package:bw1_flutter_assignment/widgets/main_appbar.dart';
import 'package:bw1_flutter_assignment/widgets/nearby_stores.dart';
import 'package:bw1_flutter_assignment/widgets/promo_banner.dart';
import 'package:bw1_flutter_assignment/widgets/refer_earn.dart';
import 'package:bw1_flutter_assignment/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: kWhitColor,
      // Top App Bar (contains Icons, location, etc.)
      appBar: const MainAppBar(),
      // Main content of the screen
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search bar at the top
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: HomeSearchBar(),
            ),
            const SizedBox(height: 20),
            // heading for CategoryGrid
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "What would you like to do today?",
                style: GoogleFonts.quicksand(
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: kMidBlack,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Category grid section
            const CategoryGrid(),
            const SizedBox(height: 10),
            // "More" option to expand categories
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
                        color: kDarkGreen,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_outlined,
                      size: 24,
                      color: kDarkGreen,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),
            // Top Picks promo banner section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Top picks for you",
                style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: kMidBlack,
                  ),
                ),
              ),
            ),
            // Promotional Banner
            PromoBanner(
              title: "DISCOUNT\n25% ALL\nFRUITS",
              buttonText: "CHECK NOW",
              color: kMidGreen,
              imagePath: "assets/fruit_Ice_cream.png",
            ),
            // Trending section title
            SectionTitle(title: "Trending"),
            // Horizontal list of trending stores
            HorizontalStoreList(),
            HorizontalStoreList(),
            // Craze Deals section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Craze deals",
                style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: kMidBlack,
                  ),
                ),
              ),
            ),
            // Horizontal scrolling craze deals
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  CrazeDealsCard(
                    title: "Customer favourite\ntop supermarkets",
                    imagePath: "assets/vegitables.png",
                    onTap: () {
                      // Navigate or show more details
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
            // Refer and Earn section
            ReferEarnCard(
              onTap: () {
                // Navigate to referral screen or show dialog
              },
              imagePath: "assets/refer_gift.png",
            ),
            // Nearby stores section title
            SectionTitle(title: "Nearby stores"),
            // Nearby store card #1
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
            // Nearby store card #2
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
            // View all stores button
            Center(
              child: TextButton(
                onPressed: () {
                  // Your action here
                },
                style: TextButton.styleFrom(
                  backgroundColor: kMidGreen,
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
                    color: kWhitColor,
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
      // Bottom Navigation Bar
      bottomNavigationBar: const MainBottomNavigationBar(currentIndex: 0),
    );
  }
}

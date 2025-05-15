import 'package:flutter/material.dart';

class NearbyStoreCard extends StatelessWidget {
  final String imagePath;
  final String storeName;
  final String cuisine;
  final String address;
  final double distanceKm;
  final double rating;
  final String deliveryTime; // e.g. “45 mins”
  final String badgeLabel; // e.g. “Top Store”
  final String promoText; // e.g. “Upto 10% OFF”
  final String itemsText; // e.g. “3400+ items available”

  const NearbyStoreCard({
    super.key,
    required this.imagePath,
    required this.storeName,
    required this.cuisine,
    required this.address,
    required this.distanceKm,
    required this.rating,
    required this.deliveryTime,
    this.badgeLabel = '',
    this.promoText = '',
    this.itemsText = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          // Right Side Content Only
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Row: Store Info and Rating
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Store Info Column
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            storeName,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            cuisine,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            '$address  |  ${distanceKm.toStringAsFixed(1)} kms',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black45,
                            ),
                          ),
                          if (badgeLabel.isNotEmpty) ...[
                            const SizedBox(height: 4),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                badgeLabel,
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                    // Rating & Time Column
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const SizedBox(height: 17),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Icon(
                                Icons.star,
                                size: 16,
                                color: Colors.black87,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                rating.toStringAsFixed(1),
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            deliveryTime,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.orange,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 3),
                const Divider(thickness: 0.8, color: Colors.black26),
                const SizedBox(height: 3),
                // Bottom Offer Row
                Row(
                  children: [
                    if (promoText.isNotEmpty) ...[
                      const Icon(
                        Icons.percent_outlined,
                        size: 16,
                        color: Colors.redAccent,
                      ),
                      const SizedBox(width: 4),
                      Text(promoText, style: const TextStyle(fontSize: 10)),
                    ],
                    if (promoText.isNotEmpty && itemsText.isNotEmpty)
                      const SizedBox(width: 16),
                    if (itemsText.isNotEmpty) ...[
                      const Icon(
                        Icons.inventory_2,
                        size: 16,
                        color: Colors.green,
                      ),
                      const SizedBox(width: 4),
                      Text(itemsText, style: const TextStyle(fontSize: 10)),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

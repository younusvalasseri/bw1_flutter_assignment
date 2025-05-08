import 'package:flutter/material.dart';

class StoreCard extends StatelessWidget {
  final String? iconPath;
  const StoreCard({super.key, this.iconPath});

  @override
  Widget build(BuildContext context) {
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
                child:
                    iconPath != null && iconPath!.isNotEmpty
                        ? Image.asset(iconPath!, fit: BoxFit.cover)
                        : const Icon(Icons.image),
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

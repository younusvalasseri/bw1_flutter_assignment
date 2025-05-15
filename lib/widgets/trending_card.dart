import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TrendingCard extends StatelessWidget {
  final String? iconPath;
  const TrendingCard({super.key, this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(10),

      width: 250,
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 70,
                width: 60,
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
                  children: [
                    Text(
                      "Mithas Bhandar",
                      style: GoogleFonts.quicksand(
                        textStyle: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Text(
                      "Sweets, North Indian",
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      "(store location)  |  6.4 kms",
                      style: TextStyle(fontSize: 12),
                    ),
                    Text("★ 4.1  |  45 mins", style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

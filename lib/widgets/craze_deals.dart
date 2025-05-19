import 'package:bw1_flutter_assignment/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CrazeDealsCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback onTap;

  const CrazeDealsCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 350,
        height: 150,
        margin: const EdgeInsets.only(right: 16),
        padding: const EdgeInsets.only(left: 25),
        decoration: BoxDecoration(
          color: kBlack,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 17),
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: kWhitColor,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: const [
                    Text(
                      "Explore",
                      style: TextStyle(
                        color: kOrange,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.arrow_forward, color: kOrange, size: 16),
                  ],
                ),
              ],
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Image.asset(
                imagePath,
                width: 150,
                height: 150,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

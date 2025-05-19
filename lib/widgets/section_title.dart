import 'package:bw1_flutter_assignment/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.quicksand(
              textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: kMidBlack,
              ),
            ),
          ),
          Text(
            "See all",
            style: TextStyle(color: kMidGreen, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

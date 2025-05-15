import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryTile extends StatelessWidget {
  final String title;
  final String? iconPath;
  final String? discount;

  const CategoryTile({
    super.key,
    required this.title,
    this.iconPath,
    this.discount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              child: Center(
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child:
                      iconPath != null && iconPath!.isNotEmpty
                          ? Image.asset(
                            iconPath!,
                            fit:
                                BoxFit
                                    .contain, // use BoxFit.cover if you want to crop
                          )
                          : const Icon(Icons.image),
                ),
              ),
            ),

            if (discount != null && discount!.isNotEmpty)
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  height: 17,
                  width: 45,
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    textAlign: TextAlign.center,
                    discount!,
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 5),
        Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.quicksand(
            textStyle: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class PromoBanner extends StatelessWidget {
  final String title;
  final String buttonText;
  final Color color;
  final String imagePath; // <-- New parameter

  const PromoBanner({
    super.key,
    required this.title,
    required this.buttonText,
    required this.color,
    required this.imagePath, // <-- Add it to constructor
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            // Left side: Text + Button
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 12),
                  if (buttonText.isNotEmpty)
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        minimumSize: const Size(200, 30),
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4), // Rectangular
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 16,
                        ),
                      ),
                      child: Text(
                        buttonText,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                ],
              ),
            ),

            // Right side: Image
            Image.asset(imagePath, width: 200, fit: BoxFit.cover),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class PromoBanner extends StatelessWidget {
  final String title;
  final String buttonText;
  final Color color;
  const PromoBanner({
    super.key,
    required this.title,
    required this.buttonText,
    required this.color,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (buttonText.isNotEmpty)
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(foregroundColor: Colors.orange),
                child: Text(buttonText),
              ),
          ],
        ),
      ),
    );
  }
}

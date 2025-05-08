import 'package:flutter/material.dart';

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
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child:
                  iconPath != null && iconPath!.isNotEmpty
                      ? Image.asset(iconPath!, fit: BoxFit.cover)
                      : const Icon(Icons.image),
            ),
            if (discount != null && discount!.isNotEmpty)
              Positioned(
                top: -2,
                left: -2,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
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
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}

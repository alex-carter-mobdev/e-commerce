import 'package:e_commerce/core/theme/color.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.value,
    required this.url,
    required this.onTap,
  });

  final String value;
  final String url;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        spacing: 5,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(1000),
            child: SizedBox(
              height: 56,
              width: 56,
              child: Image.network(url, fit: BoxFit.cover),
            ),
          ),
          Text(value, style: TextStyle(color: ThemeColor.black_100)),
        ],
      ),
    );
  }
}

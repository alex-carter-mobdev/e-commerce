import 'package:e_commerce/core/theme/color.dart';
import 'package:flutter/material.dart';

class CardPrice extends StatelessWidget {
  const CardPrice({
    super.key,
    required this.priceName,
    required this.price,
    required this.isBold,
  });
  final String priceName;
  final String price;
  final bool isBold;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          priceName,
          style: TextStyle(color: ThemeColor.black_50, fontSize: 16),
        ),
        Text(
          price,
          style: TextStyle(
            color: ThemeColor.black_100,
            fontWeight: isBold ? FontWeight.bold : null,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

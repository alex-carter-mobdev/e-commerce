import 'package:e_commerce/core/theme/color.dart';
import 'package:flutter/material.dart';

class ProductPrice extends StatelessWidget {
  const ProductPrice(this.price, {super.key});

  final String price;

  @override
  Widget build(BuildContext context) {
    return Text(
      price,
      style: TextStyle(
        color: ThemeColor.primary,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );
  }
}

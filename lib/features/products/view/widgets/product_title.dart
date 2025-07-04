import 'package:e_commerce/core/theme/color.dart';
import 'package:flutter/material.dart';

class ProductTitle extends StatelessWidget {
  final String text;

  const ProductTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        color: ThemeColor.black_100,
      ),
    );
  }
}

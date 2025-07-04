import 'package:e_commerce/features/products/view/widgets/product_button.dart';
import 'package:flutter/material.dart';

class PriceButton extends StatelessWidget {
  final void Function() onPressed;

  final String price;

  const PriceButton({super.key, required this.onPressed, required this.price});

  @override
  Widget build(BuildContext context) {
    return ProductButton(price: price, onPressed: onPressed);
  }
}

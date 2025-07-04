import 'package:e_commerce/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class ProductButton extends StatelessWidget {
  const ProductButton({
    super.key,
    required this.price,
    required this.onPressed,
  });

  final String price;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      price,
      isTrailingText: true,
      trailingText: 'Add to Bag',
      onPressed: onPressed,
    );
  }
}

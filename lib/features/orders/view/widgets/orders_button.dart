import 'package:e_commerce/core/theme/color.dart';
import 'package:flutter/material.dart';

class OrdersButton extends StatelessWidget {
  final void Function() onPressed;
  final bool isActive;
  final String name;

  const OrdersButton(
    this.name, {
    super.key,
    required this.onPressed,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
          isActive ? ThemeColor.primary : ThemeColor.secondary,
        ),
      ),
      child: Text(
        name,
        style: TextStyle(
          color: isActive ? ThemeColor.white_100 : ThemeColor.black_100,
        ),
      ),
    );
  }
}

import 'package:e_commerce/core/theme/color.dart';
import 'package:flutter/material.dart';

class CheckoutTile extends StatelessWidget {
  final String name;
  final String subtitle;
  final void Function() onPressed;

  const CheckoutTile({
    super.key,
    required this.name,
    required this.subtitle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      subtitle: Text(subtitle, style: TextStyle(fontSize: 16)),
      title: Text(
        name,
        style: TextStyle(fontSize: 12, color: ThemeColor.black_50),
      ),
      tileColor: ThemeColor.secondary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      contentPadding: EdgeInsets.only(left: 16, right: 12, top: 0, bottom: 0),
      onTap: onPressed,
    );
  }
}

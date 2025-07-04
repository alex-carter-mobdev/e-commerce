import 'package:e_commerce/core/theme/color.dart';
import 'package:flutter/material.dart';

class OrdersShippingDetails extends StatelessWidget {
  const OrdersShippingDetails({super.key, required this.addressInText});

  final String addressInText;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        color: ThemeColor.secondary,

        padding: EdgeInsets.only(left: 12, right: 21, bottom: 26, top: 27),
        child: Text(addressInText),
      ),
    );
  }
}

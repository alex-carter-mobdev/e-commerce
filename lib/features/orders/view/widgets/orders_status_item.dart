import 'package:e_commerce/core/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrdersStatusItem extends StatelessWidget {
  const OrdersStatusItem({
    super.key,
    required this.status,
    required this.dateInDays,
    required this.isDelivered,
  });
  final String status;
  final String dateInDays;

  final bool isDelivered;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: 12,
          children: [
            SvgPicture.asset(
              !isDelivered
                  ? 'assets/icons/inactive_order_tick.svg'
                  : 'assets/icons/active_order_tick.svg',
            ),
            Text(
              status,
              style: TextStyle(
                fontSize: 16,
                color: isDelivered ? ThemeColor.black_100 : ThemeColor.black_50,
              ),
            ),
          ],
        ),
        Text(
          dateInDays,
          style: TextStyle(
            fontSize: 12,
            color: isDelivered ? ThemeColor.black_100 : ThemeColor.black_50,
          ),
        ),
      ],
    );
  }
}

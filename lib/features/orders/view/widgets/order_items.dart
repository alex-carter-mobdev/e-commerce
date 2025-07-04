import 'package:e_commerce/core/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OrderItems extends StatelessWidget {
  const OrderItems({
    super.key,
    required this.title,
    required this.onViewAllPressed,
    this.onDeletePressed,
  });

  final String title;
  final void Function() onViewAllPressed;
  final void Function()? onDeletePressed;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        color: ThemeColor.secondary,

        padding: EdgeInsets.only(left: 12, right: 21, bottom: 26, top: 27),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              spacing: 12,
              children: [
                Container(
                  padding: EdgeInsets.only(right: 10),
                  width: 40,
                  height: 40,
                  child: SvgPicture.asset(
                    'assets/icons/orders.svg',
                    colorFilter: ColorFilter.mode(
                      ThemeColor.black_100,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),

            TextButton(
              onPressed: onViewAllPressed,
              child: Text(
                'View All',
                style: TextStyle(color: ThemeColor.primary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

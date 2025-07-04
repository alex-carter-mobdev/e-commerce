import 'package:e_commerce/core/theme/color.dart';
import 'package:e_commerce/core/widgets/tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OrdersTile extends StatelessWidget {
  const OrdersTile({
    super.key,
    required this.message,
    required this.subtitle,
    required this.location,
    this.onPressed,
  });

  final String message;
  final String subtitle;
  final void Function()? onPressed;
  final String? location;

  @override
  Widget build(BuildContext context) {
    return Tile(
      location: location,
      name: message,
      subtitle: subtitle,
      isBold: true,
      onPressed: onPressed,
      leading: Container(
        padding: EdgeInsets.only(right: 10),
        width: 40,
        height: 40,
        child: SvgPicture.asset(
          'assets/icons/orders.svg',
          colorFilter: ColorFilter.mode(ThemeColor.black_100, BlendMode.srcIn),
        ),
      ),
      showTrailingWidget: true,
      padding: {"top": 16, "bottom": 15},
    );
  }
}

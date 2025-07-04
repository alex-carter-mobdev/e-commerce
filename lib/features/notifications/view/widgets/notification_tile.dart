import 'package:e_commerce/core/widgets/tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile(
    this.message, {
    super.key,
    required this.isActive,
    required this.location,
  });

  final bool isActive;
  final String message;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Tile(
      location: location,
      name: message,
      leading: Container(
        padding: EdgeInsets.only(right: 10),
        width: 40,
        height: 40,
        child: SvgPicture.asset(
          isActive ? 'assets/icons/active_bing.svg' : 'assets/icons/bing.svg',
        ),
      ),
      showTrailingWidget: false,
      padding: {"top": 17, "bottom": 17},
    );
  }
}

import 'package:e_commerce/core/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LikeButton extends StatelessWidget {
  final bool isActive;
  final Color? backgroundColor;

  const LikeButton({super.key, required this.isActive, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 5,
      right: 8,
      child: IconButton(
        // highlightColor: Color(0xffFF389A),
        style: IconButton.styleFrom(backgroundColor: backgroundColor),
        onPressed: () {},
        icon: SvgPicture.asset(
          !isActive ? 'icons/heart.svg' : 'icons/active_heart.svg',
        ),
      ),
    );
  }
}

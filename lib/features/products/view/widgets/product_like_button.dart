import 'package:e_commerce/core/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductLikeButton extends StatelessWidget {
  final void Function() onPressed;
  final bool isActive;

  const ProductLikeButton({
    super.key,
    required this.onPressed,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(backgroundColor: ThemeColor.secondary),
      onPressed: onPressed,
      icon: SvgPicture.asset(
        !isActive ? 'icons/heart.svg' : 'icons/active_heart.svg',
      ),
    );
  }
}

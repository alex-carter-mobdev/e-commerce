import 'package:e_commerce/core/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgIcon extends StatelessWidget {
  const SvgIcon(this.svgInString, {super.key, required this.isActive});

  final String svgInString;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final color = isActive ? ThemeColor.primary : ThemeColor.black_50;

    return SizedBox(
      width: 40,
      height: 40,
      child: SvgPicture.asset(
        svgInString,
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      ),
    );
  }
}

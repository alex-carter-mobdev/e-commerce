import 'package:e_commerce/features/products/view/widgets/color_circle.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/core/theme/color.dart';
import 'package:flutter_svg/svg.dart';

class BottomSheetButton extends StatelessWidget {
  const BottomSheetButton({
    super.key,
    required this.color,
    required this.name,
    required this.isActive,
    required this.isColor,
    required this.onPressed,
  });

  final String color;
  final String name;
  final bool isActive;
  final bool isColor;

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isActive ? ThemeColor.primary : ThemeColor.secondary,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: 16,
              color: isActive ? ThemeColor.white_100 : ThemeColor.black_100,
            ),
          ),
          Row(
            spacing: 25,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(99),
                    child: Container(
                      width: 22,
                      height: 22,
                      color: isColor && isActive ? ThemeColor.white_100 : null,
                    ),
                  ),
                  isColor ? ColorCircle(hex: color) : SizedBox(),
                ],
              ),
              isActive
                  ? SvgPicture.asset('assets/icons/tick.svg')
                  : SizedBox(width: 24, height: 24),
            ],
          ),
        ],
      ),
    );
  }
}

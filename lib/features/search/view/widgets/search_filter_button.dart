import 'package:e_commerce/core/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchFilterButton extends StatelessWidget {
  final void Function() onPressed;
  final bool isFilter;
  final bool showDropDownIcon;
  final bool isColorPrimary;
  final String value;

  const SearchFilterButton({
    super.key,
    required this.onPressed,
    required this.isFilter,
    required this.showDropDownIcon,
    required this.isColorPrimary,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: IconButton(
        onPressed: onPressed,
        style: IconButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          backgroundColor:
              isColorPrimary ? ThemeColor.primary : ThemeColor.secondary,
        ),
        icon: Row(
          spacing: 4,
          children: [
            isFilter ? SvgPicture.asset('icons/filter.svg') : SizedBox(),
            Text(
              value,
              style: TextStyle(
                color:
                    isColorPrimary
                        ? ThemeColor.white_100
                        : ThemeColor.black_100,
              ),
            ),
            showDropDownIcon
                ? SvgPicture.asset(
                  'icons/arrow_down.svg',
                  colorFilter: ColorFilter.mode(
                    isColorPrimary
                        ? ThemeColor.white_100
                        : ThemeColor.black_100,
                    BlendMode.srcIn,
                  ),
                )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}

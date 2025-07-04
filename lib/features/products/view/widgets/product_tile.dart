import 'package:e_commerce/core/theme/color.dart';
import 'package:e_commerce/features/products/view/widgets/color_circle.dart';
import 'package:e_commerce/features/products/view/widgets/product_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    super.key,
    this.onPressed,
    required this.name,
    this.size,
    this.color,
    this.counter,
    this.decrement,
    this.increment,
  });

  final void Function()? onPressed;
  final String name;
  final String? size;
  final String? color;
  final int? counter;

  final void Function()? decrement;
  final void Function()? increment;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(99)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: ThemeColor.secondary,
          padding: EdgeInsets.only(left: 16, top: 20, bottom: 20, right: 22),
          disabledBackgroundColor: ThemeColor.secondary,
          elevation: 0,
        ),
        onPressed: counter == null ? () => onPressed?.call() : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 16, color: ThemeColor.black_100),
            ),
            counter == null
                ? Row(
                  spacing: 25,
                  children: [
                    size != null
                        ? ProductTitle(size!)
                        : ColorCircle(hex: color),
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: SvgPicture.asset(
                        'assets/icons/arrow_down.svg',
                        colorFilter: ColorFilter.mode(
                          ThemeColor.black_100,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ],
                )
                : Row(
                  spacing: 23,
                  children: [
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: IconButton(
                        onPressed: increment,
                        style: IconButton.styleFrom(
                          backgroundColor: ThemeColor.primary,
                        ),
                        icon: SvgPicture.asset('assets/icons/plus.svg'),
                      ),
                    ),
                    // SizedBox(
                    //   width: 20,
                    //   height: 20,
                    //   child:
                    Text(
                      "$counter",
                      style: TextStyle(
                        fontSize: 16,
                        color: ThemeColor.black_100,
                      ),
                      // ),
                    ),
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: IconButton(
                        onPressed: decrement,
                        style: IconButton.styleFrom(
                          backgroundColor: ThemeColor.primary,
                        ),
                        icon: SvgPicture.asset('assets/icons/minus.svg'),
                      ),
                    ),
                  ],
                ),
          ],
        ),
      ),
    );
  }
}

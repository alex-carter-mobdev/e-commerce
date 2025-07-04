import 'package:e_commerce/core/theme/color.dart';
import 'package:e_commerce/core/widgets/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CartCard extends StatelessWidget {
  final String name;
  final String size;
  final String color;
  final String price;
  final String url;
  final void Function() onPlus;
  final void Function() onMinus;
  final String quantity;

  const CartCard({
    super.key,
    required this.name,
    required this.size,
    required this.color,
    required this.price,
    required this.url,
    required this.onPlus,
    required this.onMinus,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ThemeColor.secondary,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          spacing: 12,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: ImageAsset(url, height: 64, width: 64),
            ),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.,
                children: [
                  Column(
                    spacing: 8,
                    children: [
                      Text(name),
                      Row(
                        spacing: 16,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  style: TextStyle(color: ThemeColor.black_50),
                                  text: 'Size ',
                                ),
                                TextSpan(
                                  text: '- $size',
                                  style: TextStyle(
                                    color: ThemeColor.black_100,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  style: TextStyle(color: ThemeColor.black_50),
                                  text: 'Color ',
                                ),
                                TextSpan(
                                  text: '- $color',
                                  style: TextStyle(
                                    color: ThemeColor.black_100,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(quantity),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    spacing: 8,
                    children: [
                      Text(
                        price,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Row(
                        spacing: 8,
                        children: [
                          SizedBox(
                            height: 24,
                            width: 24,
                            child: IconButton(
                              style: IconButton.styleFrom(
                                padding: EdgeInsets.all(6),
                                backgroundColor: ThemeColor.primary,
                              ),
                              onPressed: onPlus,
                              icon: SvgPicture.asset('assets/icons/plus.svg'),
                            ),
                          ),
                          SizedBox(
                            height: 24,
                            width: 24,
                            child: IconButton(
                              style: IconButton.styleFrom(
                                padding: EdgeInsets.all(6),
                                backgroundColor: ThemeColor.primary,
                              ),
                              onPressed: onMinus,
                              icon: SvgPicture.asset('assets/icons/minus.svg'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

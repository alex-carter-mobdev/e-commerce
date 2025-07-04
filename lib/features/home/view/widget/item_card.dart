import 'package:e_commerce/core/theme/color.dart';
import 'package:e_commerce/core/widgets/image_asset.dart';
import 'package:e_commerce/core/widgets/like_button.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.name,
    required this.url,
    required this.price,
    this.oldPrice,
    required this.onTap,
    required this.isActive,
  });

  final String name;
  final double price;
  final double? oldPrice;
  final String url;
  final bool isActive;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Card(
            child: Column(
              spacing: 8,
              children: [
                Stack(
                  children: [
                    SizedBox(width: 159, height: 220, child: ImageAsset(url)),
                    LikeButton(isActive: isActive),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4, right: 4, bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 8,
                    children: [
                      Text(name),

                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '\$$price  ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            oldPrice != null
                                ? TextSpan(
                                  text: '\$$oldPrice',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.lineThrough,
                                    color: ThemeColor.black_50,
                                    decorationColor: ThemeColor.black_50,
                                    decorationThickness: 2,
                                  ),
                                )
                                : TextSpan(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

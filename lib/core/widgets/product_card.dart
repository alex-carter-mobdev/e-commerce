import 'package:e_commerce/core/theme/color.dart';
import 'package:e_commerce/core/widgets/image_asset.dart';
import 'package:e_commerce/core/widgets/like_button.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.name,
    required this.url,
    required this.price,
    this.oldPrice,
    required this.onTap,
    this.width,
    this.height,
    required this.isLiked,
  });

  final String name;
  final double price;
  final double? oldPrice;
  final String url;
  final void Function() onTap;
  final double? width;
  final double? height;

  final bool isLiked;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: null,
      highlightColor: null,

      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: ThemeColor.secondary,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            SizedBox(
              child: Stack(
                children: [
                  SizedBox(
                    width: width,
                    height: height,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                      child: ImageAsset(url, height: height, width: width),
                    ),
                  ),

                  LikeButton(isActive: isLiked),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4, right: 4, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                  ),

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
    );
  }
}

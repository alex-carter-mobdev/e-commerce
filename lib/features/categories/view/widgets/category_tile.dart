import 'package:e_commerce/core/widgets/image_asset.dart';
import 'package:e_commerce/core/widgets/tile.dart';
import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    super.key,
    required this.name,
    required this.url,
    required this.onPressed,
  });
  final String name;
  final String url;

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Tile(
      location: null,
      name: name,
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: ImageAsset(url, height: 40, width: 40),
      ),
      onPressed: onPressed,
      showTrailingWidget: false,
      padding: {"top": 22, "bottom": 22},
    );
  }
}

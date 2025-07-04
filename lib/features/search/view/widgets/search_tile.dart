import 'package:e_commerce/features/categories/view/widgets/category_tile.dart';
import 'package:flutter/material.dart';

class SearchTile extends StatelessWidget {
  const SearchTile({
    super.key,
    required this.onPressed,
    required this.name,
    required this.url,
  });
  final void Function() onPressed;
  final String name;
  final String url;

  @override
  Widget build(BuildContext context) {
    return CategoryTile(name: name, url: url, onPressed: onPressed);
  }
}

// ignore_for_file: unnecessary_null_in_if_null_operators

import 'package:e_commerce/core/theme/color.dart';
import 'package:e_commerce/core/widgets/product_card.dart';
import 'package:flutter/material.dart';

class CategoryItemsViews extends StatelessWidget {
  final List<Map>? categoryList;
  final void Function(String id) onTap;

  final String categoryName;

  const CategoryItemsViews({
    super.key,
    required this.categoryList,
    required this.onTap,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return categoryList != null
        ? Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: ListView(
            children: [
              Text(
                '$categoryName (${categoryList?.length})',
                style: TextStyle(
                  fontSize: 16,
                  color: ThemeColor.black_100,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 23),
              GridView.builder(
                itemCount: categoryList?.length ?? 0,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.5,
                  mainAxisSpacing: 20.0,
                  crossAxisSpacing: 20.0,
                ),
                itemBuilder: (context, index) {
                  String id = categoryList?[index]['_id'];
                  String name = categoryList?[index]['name'];
                  String url = categoryList?[index]['url'];
                  double price = categoryList?[index]['price'];
                  bool isLiked = categoryList?[index]['isLiked'];
                  double? oldPrice = categoryList?[index]['oldPrice'] ?? null;
                  return ProductCard(
                    name: name,
                    url: url,
                    price: price,
                    onTap: () => onTap(id),
                    height: 250,
                    isLiked: isLiked,
                    oldPrice: oldPrice,
                  );
                },
              ),
            ],
          ),
        )
        : Center(child: Text("Loading"));
  }
}

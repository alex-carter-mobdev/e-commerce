import 'package:e_commerce/core/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FavortiesView extends StatelessWidget {
  const FavortiesView({super.key, required this.list});
  final List list;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: list.length,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.6,
      ),
      itemBuilder: (context, index) {
        final item = list[index];
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: ProductCard(
            name: item['name'],
            url: item['url'],
            price: item['price'],
            oldPrice: item['oldPrice'] ?? item['price'] * 2,
            onTap: () {
              context.push('/product/${item['id']}');
            },
            width: 161,
            height: 220,
            isLiked: item['isLiked'] ?? true,
          ),
        );
      },
    );
  }
}

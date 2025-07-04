import 'package:e_commerce/core/widgets/back_button.dart';
import 'package:e_commerce/features/settings/view/page/favorties/favorties_view.dart';
import 'package:flutter/material.dart';

class FavortiesPage extends StatelessWidget {
  static int count = 0;

  const FavortiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 67,
        leading: Padding(
          padding: const EdgeInsets.only(left: 27, top: 13),
          child: Back(),
        ),

        title: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            'My Favourites ($count)',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        centerTitle: true,
      ),
      body: FavortiesView(
        list: [
          {
            'name': "Nike Fuel Pack",
            'url':
                "https://images.unsplash.com/photo-1704430705052-dc2361906305?q=80&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            "price": 12,
            "oldPrice": 12 * 2,
          },
          {
            'name': "Nike Fuel Pack",
            'url':
                "https://images.unsplash.com/photo-1704430705052-dc2361906305?q=80&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            "price": 12,
            "oldPrice": 12 * 2,
          },
          {
            'name': "Nike Fuel Pack",
            'url':
                "https://images.unsplash.com/photo-1704430705052-dc2361906305?q=80&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            "price": 12,
            "oldPrice": 12 * 2,
          },
          {
            'name': "Nike Fuel Pack",
            'url':
                "https://images.unsplash.com/photo-1704430705052-dc2361906305?q=80&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            "price": 12,
            "oldPrice": 12 * 2,
          },
          {
            'name': "Nike Fuel Pack",
            'url':
                "https://images.unsplash.com/photo-1704430705052-dc2361906305?q=80&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            "price": 12,
            "oldPrice": 12 * 2,
          },
          {
            'name': "Nike Fuel Pack",
            'url':
                "https://images.unsplash.com/photo-1704430705052-dc2361906305?q=80&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            "price": 12,
            "oldPrice": 12 * 2,
          },
          {
            'name': "Nike Fuel Pack",
            'url':
                "https://images.unsplash.com/photo-1704430705052-dc2361906305?q=80&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            "price": 12,
            "oldPrice": 12 * 2,
          },
          {
            'name': "Nike Fuel Pack",
            'url':
                "https://images.unsplash.com/photo-1704430705052-dc2361906305?q=80&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            "price": 12,
            "oldPrice": 12 * 2,
          },
          {
            'name': "Nike Fuel Pack",
            'url':
                "https://images.unsplash.com/photo-1704430705052-dc2361906305?q=80&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            "price": 12,
            "oldPrice": 12 * 2,
          },
          {
            'name': "Nike Fuel Pack",
            'url':
                "https://images.unsplash.com/photo-1704430705052-dc2361906305?q=80&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            "price": 12,
            "oldPrice": 12 * 2,
          },
        ],
      ),
    );
  }
}

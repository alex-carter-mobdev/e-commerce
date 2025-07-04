import 'package:e_commerce/core/routes/router.dart';
import 'package:e_commerce/core/utils/logger.dart';
import 'package:e_commerce/core/widgets/back_button.dart';
import 'package:e_commerce/features/categories/view/page/item/category_items_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';

class NewInPage extends StatefulWidget {
  const NewInPage({super.key});

  @override
  State<NewInPage> createState() => _NewInPageState();
}

class _NewInPageState extends State<NewInPage> {
  List<Map>? newIn;
  String localhost =
      "${dotenv.env['API_URL']!.replaceAll('/api', '')}/uploads/categories/";
  List? likes;
  @override
  void initState() {
    super.initState();
    if (mounted) {
      setState(() {
        newIn = [
          {
            "_id": "683b202b075822c20b228fc4",
            "name": "T-Shirts",
            "url": "$localhost/t_shirts.jpg",
            "price": 104.99,
            "oldPrice": 204.99,
            "isLiked": true,
          },
          {
            "_id": "683b202b075822c20b228fc5",
            "name": "Jeans",
            "url": "$localhost/jeans.jpg",
            "price": 205.99,
            "isLiked": false,
          },
          {
            "_id": "683b202b075822c20b228fc6",
            "name": "Dresses",
            "url": "$localhost/dresses.jpg",
            "price": 206.99,
            "isLiked": false,
          },
          {
            "_id": "683b202b075822c20b228fc7",
            "name": "Jackets",
            "url": "$localhost/jackets.jpg",
            "price": 105.99,
            "oldPrice": 205.99,
            "isLiked": true,
          },
          {
            "_id": "683b202b075822c20b228fc8",
            "name": "Shirts",
            "url": "$localhost/shirts.jpg",
            "price": 54.99,
            "oldPrice": 104.99,
            "isLiked": true,
          },
          {
            "_id": "683b202b075822c20b228fc9",
            "name": "Sweaters",
            "url": "$localhost/sweaters.jpg",
            "price": 209.99,
            "isLiked": false,
          },
          {
            "_id": "683b202b075822c20b228fca",
            "name": "Shorts",
            "url": "$localhost/shorts.jpg",
            "price": 64.99,
            "oldPrice": 114.99,
            "isLiked": true,
          },
          {
            "_id": "683b202b075822c20b228fcb",
            "name": "Shoes",
            "url": "$localhost/shoes.jpg",
            "price": 211.99,
            "isLiked": true,
          },
        ];
        likes = newIn!.map((e) => e['isLiked']).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    void onTap(String id) {
      context.push("${Routes.products}/$id");
    }

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        leading: Padding(
          padding: const EdgeInsets.only(left: 30, bottom: 5, top: 5),
          child: Back(),
        ),
      ),
      body: CategoryItemsViews(
        categoryList: newIn,
        onTap: onTap,
        categoryName: 'New In',
      ),
    );
  }
}

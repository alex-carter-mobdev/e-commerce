import 'package:e_commerce/core/routes/router.dart';
import 'package:e_commerce/core/theme/color.dart';
import 'package:e_commerce/core/utils/logger.dart';
import 'package:e_commerce/core/utils/toast.dart';
import 'package:e_commerce/features/categories/model/categories_services.dart';
import 'package:e_commerce/features/home/view/page/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map>? category;
  List<Map>? topSelling;
  List<Map>? newIn;
  Map<String, List>? likes;

  @override
  void initState() {
    super.initState();
    String localhost =
        "${dotenv.env['API_URL']!.replaceAll('/api', '')}/uploads/categories/";
    Toastify.init(context);
    Future.delayed(Duration(seconds: 1), () async {
      if (mounted) {
        setState(() {
          getCategories();
          topSelling = [
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
          List topSellingsLikes = topSelling!.map((e) => e['isLiked']).toList();
          List newInLikes = newIn!.map((e) => e['isLiked']).toList();
          likes = {
            'topSellingsLikes': topSellingsLikes,
            'newInLikes': newInLikes,
          };
        });
      }
    });
  }

  void getCategories() async {
    var res = await CategoriesServices().getCategoriesData();
    List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(res.$3);

    if (res.$1) {
      setState(() {
        category = data;
      });
    } else {
      Toastify.e(res.$2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: InkWell(
            onTap: onSettingTap,
            child: SizedBox(
              width: 40,
              height: 40,
              child: SvgPicture.asset('icons/user_icon.svg'),
            ),
          ),
        ),
        leadingWidth: 64,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: InkWell(
              onTap: onCartTap,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: ThemeColor.primary,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'icons/cart.svg',
                    width: 16,
                    height: 16,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: HomeView(
        category: category,
        topSelling: topSelling,
        newIn: newIn,
        onInputTap: onInputTap,
        onCategoryItemTap: onCategoryItemTap,
        onCategoryTap: onCategoryTap,
        onTopSellingItemTap: onTopSellingItemTap,
        onNewInTap: onNewInTap,
        onTopSellingTap: onTopSellingTap,
        onNewInItemTap: onNewInItemTap,
        likes: likes,
      ),
    );
  }

  void onInputTap() {
    context.push(Routes.search);
  }

  void onCartTap() {
    context.push(Routes.cart);
  }

  void onSettingTap() {
    context.push(Routes.settings);
  }

  void onCategoryTap() {
    context.push(Routes.categories);
  }

  void onTopSellingTap() {
    context.push(Routes.topSelling);
  }

  void onCategoryItemTap(id, categoryName) {
    context.push('${Routes.categories}/$id?categoryName=$categoryName');
  }

  void onTopSellingItemTap() {
    // context.push(Routes.product);
  }
  void onNewInItemTap() {
    // context.push(Routes.product);
  }

  void onNewInTap() {
    context.push(Routes.newIn);
  }
}

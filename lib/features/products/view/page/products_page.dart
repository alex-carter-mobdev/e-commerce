import 'package:e_commerce/core/theme/color.dart';
import 'package:e_commerce/core/utils/logger.dart';
import 'package:e_commerce/core/widgets/back_button.dart';
import 'package:e_commerce/core/widgets/like_button.dart';
import 'package:e_commerce/features/products/view/page/products_view.dart';
import 'package:e_commerce/features/products/view/widgets/product_bottom_sheet.dart';
import 'package:e_commerce/features/products/view/widgets/product_button.dart';
import 'package:e_commerce/features/products/view/widgets/product_like_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ProductsPage extends StatefulWidget {
  final String id;
  final Map<String, String> querryParamerts;

  const ProductsPage({
    super.key,
    required this.id,
    required this.querryParamerts,
  });

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  Map<String, dynamic>? productData;
  bool isLiked = false;
  String? selectedSize;
  String? selectedColor;
  Map productOptionsValues = {'size': '', 'color': '', 'quantity': 0};

  @override
  void initState() {
    super.initState();
    // ! fetch by id, using id that comes as parameter
    Future.delayed(
      Duration(seconds: 1),
      () => setState(() {
        productData = {
          "_id": "683b202b075822c20b228fc4",
          "name": "T-Shirts",
          "url": [
            "$localhost/t_shirts.jpg",
            "$localhost/jeans.jpg",
            "$localhost/dresses.jpg",
            "$localhost/jackets.jpg",
            "$localhost/shirts.jpg",
            "$localhost/sweaters.jpg",
          ],
          "price": 104.99,
          "isLiked": true,
          "size": [
            {'title': 'S'},
            {'title': 'M'},
            {'title': 'L'},
            {'title': 'XL'},
            {'title': '2XL'},
          ],
          "color": [
            {'title': 'Orange', 'color': "EC6D26"},
            {'title': 'Black', 'color': "272727"},
            {'title': 'Red', 'color': "FA3636"},
            {'title': 'Yellow', 'color': "F4BD2F"},
            {'title': 'Blue', 'color': "4468E5"},
          ],
          'quantity': 0,
        };
        isLiked = productData!['isLiked'];
      }),
    );
  }

  void onLikeButtonPressed() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    void onSelected(value, type, modalSetterStateFn) {
      var selColor =
          productData?['color']
              .where((element) => element['title'] == value)
              .toList();
      var state = type == 'color' ? selColor[0]['color'] : value;
      modalSetterStateFn(() {
        productOptionsValues[type] = state;
      });
      setState(() {
        productOptionsValues[type] = state;
      });
    }

    void onTilePressed(String type) {
      showModalBottomSheet(
        context: context,

        builder:
            (context) => StatefulBuilder(
              builder: (context, setState) {
                return ProductBottomSheet(
                  name: type == 'color' ? "Color" : "Size",
                  list:
                      type == 'color'
                          ? productData!['color']
                          : productData!['size'],
                  onSelected: (value) => onSelected(value, type, setState),
                  state: productOptionsValues[type],
                );
              },
            ),
      );
    }

    void decrement() {
      var quantity = productOptionsValues['quantity'];
      setState(() => quantity <= 0 ? null : quantity -= 1);
    }

    void increment() {
      setState(() => productOptionsValues['quantity'] += 1);
    }

    void onAddToBagPressed() {
      logger.i(productOptionsValues);
    }

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        leading: Padding(
          padding: const EdgeInsets.only(left: 30, bottom: 5, top: 5),
          child: Back(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: ProductLikeButton(
              onPressed: onLikeButtonPressed,
              isActive: isLiked,
            ),
          ),
        ],
      ),
      body: ProductsView(
        productData: productData,
        onTilePressed: onTilePressed,
        selectedSize: productOptionsValues['size'],
        selectedColor: productOptionsValues['color'],
        counter: productOptionsValues['quantity'],
        decrement: decrement,
        increment: increment,
        onAddToBagPressed: onAddToBagPressed,
      ),
    );
  }

  static String localhost =
      "${dotenv.env['API_URL']!.replaceAll('/api', '')}/uploads/categories";
}

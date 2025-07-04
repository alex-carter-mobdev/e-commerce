import 'package:e_commerce/core/bloc/user_bloc.dart';
import 'package:e_commerce/core/bloc/user_event.dart';
import 'package:e_commerce/core/routes/router.dart';
import 'package:e_commerce/core/utils/logger.dart';
import 'package:e_commerce/core/utils/toast.dart';
import 'package:e_commerce/core/widgets/back_button.dart';
import 'package:e_commerce/features/cart/model/cart_service.dart';
import 'package:e_commerce/features/cart/view/pages/cart_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  Map? products = {};
  List quantities = [];
  List price = [];
  late User user;

  Future<void> getUserData(user) async {
    var res = await CartService().getUserData();
    var data = res.$3;
    // logger.i(res.$1);
    if (res.$1) {
      user.add(
        SetUserData(
          id: data!['_id'] as String?,

          addresses:
              (data['addresses'] as List?)
                  ?.map((e) => Map<String, String>.from(e))
                  .toList(),
          payments:
              (data['payments'] as List?)
                  ?.map((e) => Map<String, String>.from(e))
                  .toList(),
        ),
      );
    } else {
      Toastify.e(res.$2);
    }
  }

  @override
  void initState() {
    super.initState();
    Toastify.init(context);
    user = BlocProvider.of<User>(context);
    Future.delayed(Duration(seconds: 1), () async {
      await getUserData(user);
      setState(() {
        if (mounted) {
          products = {
            'list': [
              {
                "_id": "683b202b075822c20b228fc4",
                "name": "T-Shirts",
                "url":
                    "${dotenv.env['API_URL']!.replaceAll('/api', '')}/uploads/categories/sweaters.jpg",

                "price": 104.99,
                "size": '2XL',
                "color": "4468E5",

                'quantity': 1,
              },
              {
                "_id": "683b2024075822c20b228fc4",
                "name": "T-Shirts",
                "url":
                    "${dotenv.env['API_URL']!.replaceAll('/api', '')}/uploads/categories/shoes.jpg",

                "price": 104.99,
                "size": '2XL',
                "color": "4468E5",

                'quantity': 1,
              },
              {
                "_id": "683b212b395822c20b228fc4",
                "name": "T-Shirts",
                "url":
                    "${dotenv.env['API_URL']!.replaceAll('/api', '')}/uploads/categories/jeans.jpg",

                "price": 104.99,
                "size": '2XL',
                "color": "4468E5",

                'quantity': 1,
              },
            ],
            'Shipping_cost': 8,
          };
          quantities = products?['list'].map((e) => e['quantity']).toList();
          price = products?['list'].map((e) => e['price']).toList();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    String subtotal =
        price.isEmpty
            ? '0.00'
            : price
                .reduce((value, element) => value + element)
                .toStringAsFixed(2);
    String shippingCost =
        products?['Shipping_cost']?.toStringAsFixed(2) ?? '0.00';
    String tax = products?['tax']?.toStringAsFixed(2) ?? '0.00';
    String total =
        '${num.parse(subtotal) + num.parse(shippingCost) + num.parse(tax)}';

    void onIncremented(int index) {
      setState(() {
        quantities[index] += 1;

        price[index] += products?['list'][index]['price'];
        price[index] = double.parse(price[index].toStringAsFixed(2));
      });
    }

    void onDecremented(int index) {
      setState(() {
        quantities[index] <= 0 ? null : quantities[index] -= 1;
        price[index] -= products?['list'][index]['price'];
        price[index] = double.parse(price[index].toStringAsFixed(2));
      });
    }

    void removeAllPressed() {
      setState(() {
        products = null;
      });
    }

    void onCheckOutPressed() {
      context.push(
        "${Routes.checkout}?subtotal=$subtotal&shipping_cost=$shippingCost&tax=$tax&total=$total",
      );
    }

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        leading: Padding(
          padding: const EdgeInsets.only(left: 30, bottom: 5, top: 5),
          child: Back(),
        ),
        title: Text(
          'Cart',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: CartView(
        list: products,
        onIncremented: onIncremented,
        onDecremented: onDecremented,
        quantities: quantities,
        price: price,
        removeAllPressed: removeAllPressed,
        onCheckOutPressed: onCheckOutPressed,
        shippingCost: shippingCost,
        tax: tax,
        subtotal: subtotal,
        total: total,
      ),
    );
  }
}

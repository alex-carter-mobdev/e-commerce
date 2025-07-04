import 'package:e_commerce/core/routes/router.dart';
import 'package:e_commerce/features/orders/view/page/list/orders_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  void executeOnPressed() {}

  @override
  Widget build(BuildContext context) {
    void onTilePressed(id) {
      context.push('${Routes.orders}/$id');
    }

    return Scaffold(
      appBar: AppBar(title: Text('Orders'), centerTitle: true),

      body: OrdersView(
        list: [
          {
            'title': "Order  #456765",
            'countOfItems': "4 items",
            '_id': '452676',
          },
          {
            'title': "Order  #456765",
            'countOfItems': "4 items",
            '_id': '123456',
          },
          {
            'title': "Order  #456765",
            'countOfItems': "4 items",
            '_id': '982676',
          },
          {
            'title': "Order  #456765",
            'countOfItems': "4 items",
            '_id': '267657',
          },
          {
            'title': "Order  #456765",
            'countOfItems': "4 items",
            '_id': '874020',
          },
        ],
        onTilePressed: onTilePressed,
        executeOnPressed: executeOnPressed,
      ),
    );
  }
}

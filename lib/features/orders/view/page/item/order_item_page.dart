// ignore_for_file: unused_local_variable, use_super_parameters
import 'package:e_commerce/core/widgets/back_button.dart';
import 'package:e_commerce/features/orders/view/page/item/order_item_view.dart';
import 'package:flutter/material.dart';

class OrderItemPage extends StatelessWidget {
  final String id;

  const OrderItemPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //! fetch data by id
    Map<String, dynamic> newData = {
      'order': 'Order #$id',
      'status': [
        {'isActive': false, 'status': "Delivered", 'date': "28 May"},
        {'isActive': true, 'status': "Shipped", 'date': "28 May"},
        {'isActive': true, 'status': "Order Confirmed", 'date': "28 May"},
        {'isActive': true, 'status': "Order Placed", 'date': "28 May"},
      ],
      "order_items": "4 items",
      'shipping_details':
          "2715 Ash Dr. San Jose, South Dakota 83475 121-224-7890",
    };
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        leading: Padding(
          padding: const EdgeInsets.only(left: 27, bottom: 5, top: 5),
          child: Back(),
        ),
        title: Text(newData['order']),
        centerTitle: true,
      ),

      body: OrderItemView(map: newData),
    );
  }
}

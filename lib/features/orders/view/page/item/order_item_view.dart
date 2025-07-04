import 'package:e_commerce/core/theme/color.dart';
import 'package:e_commerce/features/orders/view/widgets/order_items.dart';
import 'package:e_commerce/features/orders/view/widgets/orders_shipping_details.dart';
import 'package:e_commerce/features/orders/view/widgets/orders_status_item.dart';
import 'package:flutter/material.dart';

class OrderItemView extends StatelessWidget {
  final Map map;

  const OrderItemView({super.key, required this.map});

  @override
  Widget build(BuildContext context) {
    var list = (map['status'] as List<dynamic>).asMap().entries;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 42),
        child: Column(
          spacing: 40,
          children: [
            Column(
              spacing: 51.0,
              children:
                  list.map((e) {
                    var status = e.value['status'];
                    var dateInDays = e.value['date'];
                    var isDelivered = e.value['isActive'];
                    return OrdersStatusItem(
                      status: status,
                      dateInDays: dateInDays,
                      isDelivered: isDelivered,
                    );
                  }).toList(),
            ),
            Column(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Order Items',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ThemeColor.black_100,
                    fontSize: 16,
                  ),
                ),
                OrderItems(title: map['order_items'], onViewAllPressed: () {}),
              ],
            ),
            Column(
              spacing: 14,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Shipping details',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ThemeColor.black_100,
                    fontSize: 16,
                  ),
                ),
                OrdersShippingDetails(addressInText: map['shipping_details']),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

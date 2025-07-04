import 'package:e_commerce/features/orders/view/widgets/orders_button.dart';
import 'package:e_commerce/features/orders/view/widgets/orders_tile.dart';
import 'package:flutter/material.dart';

class OrdersView extends StatefulWidget {
  final List list;
  final void Function() executeOnPressed;
  final void Function(dynamic id) onTilePressed;

  const OrdersView({
    super.key,
    required this.list,
    required this.executeOnPressed,
    required this.onTilePressed,
  });

  @override
  State<OrdersView> createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrdersView> {
  String currentStatus = 'processing';
  List statusLists = [
    {'name': 'Processing', 'status': 'processing'},
    {'name': 'Shipped', 'status': 'shipped'},
    {'name': 'Delivered', 'status': 'delivered'},
    {'name': 'Returned', 'status': 'returned'},
    {'name': 'Canceled', 'status': 'canceled'},
    {'name': 'Order Confirmed ', 'status': 'confirmed '},
    {'name': 'Order Placed', 'status': 'placed'},
  ];

  onTap(status) {
    // setState(
    //   () =>
    //       state = switch (status) {
    //         'processing' => 'processing',
    //         'shipped' => 'shipped',
    //         'delivered' => 'delivered',
    //         'returned' => 'returned',
    //         'canceled' => 'canceled',
    //         'confirmed' => 'confirmed',
    //         'placed' => 'placed',
    //         _ => '',
    //       },
    // );

    switch (status) {
      case 'processing':
        setState(() => currentStatus = 'processing');
        widget.executeOnPressed();
        break;
      case 'shipped':
        setState(() => currentStatus = 'shipped');
        widget.executeOnPressed();
        break;
      case 'delivered':
        setState(() => currentStatus = 'delivered');
        widget.executeOnPressed();
        break;
      case 'returned':
        setState(() => currentStatus = 'returned');
        widget.executeOnPressed();
        break;
      case 'canceled':
        setState(() => currentStatus = 'canceled');
        widget.executeOnPressed();
        break;
      case 'confirmed':
        setState(() => currentStatus = 'confirmed');
        widget.executeOnPressed();
        break;
      case 'placed':
        setState(() => currentStatus = 'placed');
        widget.executeOnPressed();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 30,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 27),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: statusLists.length,
                itemBuilder: (context, index) {
                  Map item = statusLists[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13),
                    child: OrdersButton(
                      item['name'],
                      onPressed: () => onTap(item['status']),
                      isActive: currentStatus == item['status'],
                    ),
                  );
                },
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 24),
            child: Column(
              children: [
                ...widget.list.asMap().entries.map((e) {
                  String title = e.value['title'];
                  String countOfItems = e.value['countOfItems'];
                  dynamic id = e.value['_id'];

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 24,
                    ),
                    child: OrdersTile(
                      message: title,
                      subtitle: countOfItems,
                      location: null,
                      onPressed: () => widget.onTilePressed(id),
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


// ! DONT FORGET TO SET THIS TO THE MaterialApp
//         scrollBehavior: AppScrollBehavior(),


// class AppScrollBehavior extends MaterialScrollBehavior {
//   @override
//   Set<PointerDeviceKind> get dragDevices => {
//     PointerDeviceKind.touch,
//     PointerDeviceKind.mouse,
//     PointerDeviceKind.trackpad,
//   };
// }

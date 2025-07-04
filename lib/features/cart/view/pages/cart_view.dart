import 'package:e_commerce/core/widgets/primary_button.dart';
import 'package:e_commerce/features/cart/view/widgets/card_price.dart';
import 'package:e_commerce/features/cart/view/widgets/cart_card.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  final Map? list;
  final void Function(int) onIncremented;
  final void Function(int) onDecremented;
  final List quantities;
  final List price;
  final void Function() removeAllPressed;
  final void Function() onCheckOutPressed;

  final String subtotal;
  final String shippingCost;
  final String tax;
  final String total;

  const CartView({
    super.key,
    required this.list,
    required this.onIncremented,
    required this.onDecremented,
    required this.price,
    required this.shippingCost,
    required this.quantities,
    required this.removeAllPressed,
    required this.onCheckOutPressed,
    required this.subtotal,
    required this.tax,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return list == null
        ? Center(child: Text('Your Cart is Empty'))
        : list!.isEmpty
        ? Center(child: Text('Loading...'))
        : Padding(
          padding: const EdgeInsets.only(
            top: 24,
            left: 24,
            bottom: 15,
            right: 24,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: removeAllPressed,
                    child: Text('Remove all'),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: list?['list'].length,
                    itemBuilder: (BuildContext context, int index) {
                      return CartCard(
                        name: list?['list'][index]['name'],
                        size: list?['list'][index]['size'],
                        color: list?['list'][index]['color'],
                        price: "${price[index]}",
                        url: list?['list'][index]['url'],
                        onPlus: () => onIncremented(index),
                        onMinus: () => onDecremented(index),
                        quantity: "${quantities[index]}",
                      );
                    },
                  ),
                ],
              ),
              Column(
                children: [
                  CardPrice(
                    priceName: "Subtotal",
                    price: "\$$subtotal",
                    isBold: false,
                  ),
                  CardPrice(
                    priceName: "Shipping Cost",
                    price: "\$$shippingCost",
                    isBold: false,
                  ),
                  CardPrice(priceName: "Tax", price: "\$$tax", isBold: false),
                  CardPrice(
                    priceName: "Total",
                    price: "\$$total",
                    isBold: true,
                  ),
                ],
              ),
              PrimaryButton('Checkout', onPressed: onCheckOutPressed),
            ],
          ),
        );
  }
}

import 'package:e_commerce/core/utils/logger.dart';
import 'package:e_commerce/features/cart/view/widgets/card_price.dart';
import 'package:e_commerce/features/checkout/viewModel/bloc/checkout_bloc.dart';
import 'package:e_commerce/features/checkout/view/widgets/price_button.dart';
import 'package:e_commerce/features/checkout/view/widgets/checkout_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutView extends StatelessWidget {
  final void Function() onAddressPressed;
  final void Function() onPaymentPressed;
  final void Function() onPricePressed;

  const CheckoutView({
    super.key,
    required this.onAddressPressed,
    required this.onPaymentPressed,
    required this.onPricePressed,
  });

  @override
  Widget build(BuildContext context) {
    final checkout = BlocProvider.of<CheckoutBloc>(context);
    Map addressValue = {};
    Map paymentValue = {};
    RegExp addressRegex = RegExp(r'^(street|city|state|zipCode)$');
    RegExp paymentRegex = RegExp(r'^(cardNumber|cardName|ccv|expireDate)$');
    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 24, bottom: 15, right: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BlocBuilder<CheckoutBloc, CheckoutState>(
            bloc: checkout,
            builder: (context, state) {
              addressValue = state.address;
              paymentValue = state.payment;
              // logger.i([paymentValue, state.payment]);
              addressValue.removeWhere(
                (key, value) => !addressRegex.hasMatch(key),
              );
              paymentValue.removeWhere(
                (key, value) => !paymentRegex.hasMatch(key),
              );
              return Column(
                spacing: 16,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CheckoutTile(
                    name: "Shipping Address",
                    subtitle:
                        state.address.isEmpty
                            ? "Add Shipping Address"
                            : addressValue.values.join(' '),
                    onPressed: onAddressPressed,
                  ),
                  CheckoutTile(
                    name: "Payment Method",
                    subtitle:
                        state.payment.isEmpty
                            ? "Add Payment Method"
                            : paymentValue.values.join(' '),
                    onPressed: onPaymentPressed,
                  ),
                ],
              );
            },
          ),

          BlocBuilder<CheckoutBloc, CheckoutState>(
            bloc: checkout,
            builder: (context, state) {
              var prices = state.prices;
              return Column(
                children: [
                  CardPrice(
                    priceName: "Subtotal",
                    price: "\$${prices['subtotal']}",
                    isBold: false,
                  ),
                  CardPrice(
                    priceName: "Shipping Cost",
                    price: "\$${prices['shipping_cost']}",
                    isBold: false,
                  ),
                  CardPrice(
                    priceName: "Tax",
                    price: "\$${prices['tax']}",
                    isBold: false,
                  ),
                  CardPrice(
                    priceName: "Total",
                    price: "\$${prices['total']}",
                    isBold: true,
                  ),
                  SizedBox(height: 89),
                  PriceButton(
                    price: "\$${prices['total']}",
                    onPressed: onPricePressed,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

// ignore_for_file: no_leading_underscores_for_local_identifiers
import 'package:e_commerce/core/routes/router.dart';
import 'package:e_commerce/core/utils/toast.dart';
import 'package:e_commerce/core/widgets/back_button.dart';
import 'package:e_commerce/features/checkout/view/pages/checkout/checkout_view.dart';
import 'package:e_commerce/features/checkout/viewModel/bloc/checkout_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CheckoutPage extends StatefulWidget {
  final Map<String, String> querryParamerts;

  const CheckoutPage({super.key, required this.querryParamerts});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  late CheckoutBloc checkout;
  @override
  void initState() {
    super.initState();
    checkout = BlocProvider.of<CheckoutBloc>(context);
    if (widget.querryParamerts['total'] != null) {
      checkout.add(
        SetCheckoutData(
          prices: {
            "total": widget.querryParamerts['total'],
            "subtotal": widget.querryParamerts['subtotal'],
            "tax": widget.querryParamerts['tax'],
            "shipping_cost": widget.querryParamerts['shipping_cost'],
          },
        ),
      );
    }

    Toastify.init(context);
  }

  @override
  Widget build(BuildContext context) {
    void onAddressPressed() {
      context.push(Routes.selectAddress);
    }

    void onPaymentPressed() {
      context.push(Routes.selectPayment);
    }

    void onPricePressed() {}

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        leading: Padding(
          padding: const EdgeInsets.only(left: 30, bottom: 5, top: 5),
          child: Back(),
        ),
        title: Text(
          'Checkout',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: CheckoutView(
        onAddressPressed: onAddressPressed,
        onPaymentPressed: onPaymentPressed,
        onPricePressed: onPricePressed,
      ),
    );
  }
}

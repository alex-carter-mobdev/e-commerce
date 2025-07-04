import 'package:e_commerce/core/bloc/user_bloc.dart';
import 'package:e_commerce/core/routes/router.dart';
import 'package:e_commerce/core/utils/logger.dart';
import 'package:e_commerce/core/utils/toast.dart';
import 'package:e_commerce/core/widgets/back_button.dart';
import 'package:e_commerce/features/checkout/viewModel/bloc/checkout_bloc.dart';
import 'package:e_commerce/features/checkout/view/pages/select_payment/select_payment_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SelectPaymentPage extends StatefulWidget {
  const SelectPaymentPage({super.key});

  @override
  State<SelectPaymentPage> createState() => _SelectPaymentPageState();
}

class _SelectPaymentPageState extends State<SelectPaymentPage> {
  List<Map<String, String>> list = [];
  late User user;
  @override
  void initState() {
    super.initState();
    Toastify.init(context);
    Future.delayed(Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          user = BlocProvider.of<User>(context);
          list = user.state.payments;
          logger.i(['list and payments:', list, user.state.payments]);
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var checkout = BlocProvider.of<CheckoutBloc>(context);
    void onTap(int index) {
      checkout.add(SetCheckoutData(payment: user.state.payments[index]));

      context.push(Routes.checkout);
    }

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        leading: Padding(
          padding: const EdgeInsets.only(left: 30, bottom: 5, top: 5),
          child: Back(),
        ),
        title: Text(
          'Select Payment',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SelectPaymentView(list: list, onTap: onTap),
      ),
    );
  }
}

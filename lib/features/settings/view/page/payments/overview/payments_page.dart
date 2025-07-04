import 'package:e_commerce/core/bloc/user_bloc.dart';
import 'package:e_commerce/core/bloc/user_event.dart';
import 'package:e_commerce/core/routes/router.dart';
import 'package:e_commerce/core/utils/logger.dart';
import 'package:e_commerce/core/utils/toast.dart';
import 'package:e_commerce/core/widgets/back_button.dart';
import 'package:e_commerce/features/settings/model/settings_service.dart';
import 'package:e_commerce/features/settings/view/page/payments/overview/payments_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PaymentsPage extends StatefulWidget {
  final Map<String, String> querryParamerts;
  const PaymentsPage({super.key, required this.querryParamerts});

  @override
  State<PaymentsPage> createState() => _PaymentsPageState();
}

class _PaymentsPageState extends State<PaymentsPage> {
  @override
  void initState() {
    super.initState();
    Toastify.init(context);
  }

  @override
  Widget build(BuildContext context) {
    final user = BlocProvider.of<User>(context);

    void onAdd() {
      context.push("${Routes.payments}/:add");
    }

    void onDelete(String id) async {
      var res = await SettingsService().deletePayments(id);

      res.$1 ? user.add(ReFetchUserData()) : Toastify.e(res.$2);
    }

    void onEdit(
      String id,
      String cardNumber,
      String ccv,
      String exp,
      String cardholderName,
    ) {
      var path =
          "${Routes.payments}/$id?cardNumber=$cardNumber&ccv=$ccv&exp=$exp&cardholderName=$cardholderName";
      context.push(path);
    }

    void onTap(String id) {
      var qp = widget.querryParamerts;
      logger.i(qp['url'] != null);
      if (qp['url'] != null) {
        context.push("$qp?selectedPaymentId=$id");
      } else {
        null;
      }
    }

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        leading: Padding(
          padding: const EdgeInsets.only(left: 27, bottom: 5),
          child: Back(),
        ),
        title: Text('Payments'),
        centerTitle: true,
      ),
      body: PaymentsView(
        onAdd: onAdd,
        onEdit: onEdit,
        onDelete: onDelete,
        onTap: onTap,
      ),
    );
  }
}

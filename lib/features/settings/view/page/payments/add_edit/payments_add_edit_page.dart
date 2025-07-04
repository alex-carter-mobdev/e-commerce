// ignore_for_file: use_build_context_synchronously

import 'package:e_commerce/core/utils/toast.dart';
import 'package:e_commerce/core/widgets/back_button.dart';
import 'package:e_commerce/features/settings/model/settings_service.dart';
import 'package:e_commerce/core/bloc/user_bloc.dart';
import 'package:e_commerce/core/bloc/user_event.dart';
import 'package:e_commerce/features/settings/view/page/payments/add_edit/payments_add_edit_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';

class PaymentsAddEditPage extends StatefulWidget {
  const PaymentsAddEditPage({
    super.key,
    required this.id,
    required this.querryParameters,
  });
  final String id;
  final Map<String, String> querryParameters;

  @override
  State<PaymentsAddEditPage> createState() => _PaymentsAddEditPageState();
}

class _PaymentsAddEditPageState extends State<PaymentsAddEditPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _cardNumberKey = GlobalKey<FormBuilderFieldState>();
  final _ccvKey = GlobalKey<FormBuilderFieldState>();
  final _expKey = GlobalKey<FormBuilderFieldState>();
  final _cardholderNameKey = GlobalKey<FormBuilderFieldState>();

  @override
  void initState() {
    super.initState();
    Toastify.init(context);
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = BlocProvider.of<User>(context);

    Future<void> onSave() async {
      _formKey.currentState!.saveAndValidate(focusOnInvalid: true);

      if (_formKey.currentState!.isValid) {
        var value = _formKey.currentState!.value;

        if (widget.id == ':add') {
          var response = await SettingsService().addPayments(value);
          if (response.$1) {
            user.add(ReFetchUserData());
            context.pop();
          } else {
            Toastify.e(response.$2);
          }
        } else {
          var response = await SettingsService().editPayments(value, widget.id);
          if (response.$1) {
            user.add(ReFetchUserData());
            context.pop();
          } else {
            Toastify.e(response.$2);
          }
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 67,
        leading: Padding(
          padding: const EdgeInsets.only(left: 27, top: 13),
          child: Back(),
        ),

        title: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            '${widget.id == ':add' ? 'Add' : "Edit"} Payments',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body: PaymentsAddEditView(
        _formKey,
        _cardNumberKey,
        _ccvKey,
        _expKey,
        _cardholderNameKey,
        widget.querryParameters,
        onSave: onSave,
      ),
    );
  }
}

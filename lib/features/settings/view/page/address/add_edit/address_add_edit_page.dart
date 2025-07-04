// ignore_for_file: use_build_context_synchronously

import 'package:e_commerce/core/utils/toast.dart';
import 'package:e_commerce/core/widgets/back_button.dart';
import 'package:e_commerce/features/settings/model/settings_service.dart';
import 'package:e_commerce/features/settings/view/page/address/add_edit/address_add_edit_view.dart';
import 'package:e_commerce/core/bloc/user_bloc.dart';
import 'package:e_commerce/core/bloc/user_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';

class AddressAddEditPage extends StatefulWidget {
  const AddressAddEditPage({
    super.key,
    required this.id,
    required this.querryParameters,
  });
  final String id;
  final Map<String, String> querryParameters;

  @override
  State<AddressAddEditPage> createState() => _AddressAddEditPageState();
}

class _AddressAddEditPageState extends State<AddressAddEditPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _streetAddressKey = GlobalKey<FormBuilderFieldState>();
  final _cityKey = GlobalKey<FormBuilderFieldState>();
  final _stateKey = GlobalKey<FormBuilderFieldState>();
  final _zipCodeKey = GlobalKey<FormBuilderFieldState>();

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
          var response = await SettingsService().addAddress(value);
          if (response.$1) {
            user.add(ReFetchUserData());
            context.pop();
          } else {
            Toastify.e(response.$2);
          }
        } else {
          var response = await SettingsService().editAddress(value, widget.id);
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
            '${widget.id == ':add' ? 'Add' : "Edit"} Address',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body: AddressAddEditView(
        _formKey,
        _streetAddressKey,
        _cityKey,
        _stateKey,
        _zipCodeKey,
        widget.querryParameters,
        onSave: onSave,
      ),
    );
  }
}

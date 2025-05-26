// ignore_for_file: no_leading_underscores_for_local_identifiers, file_names, use_build_context_synchronously
import 'package:e_commerce/core/routes/router.dart';
import 'package:e_commerce/core/utils/logger.dart';
import 'package:e_commerce/core/utils/toast.dart';

import 'package:e_commerce/features/auth/model/service/auth_service.dart';
import 'package:e_commerce/features/auth/view/page/reset_password/reset_password_view.dart';
import 'package:e_commerce/features/auth/view/widgets/back_button.dart';
import 'package:e_commerce/features/auth/viewModel/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _resetCodeFieldKey = GlobalKey<FormBuilderFieldState>();
  final _passwordFieldKey = GlobalKey<FormBuilderFieldState>();

  bool loading = false;

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
    Future<void> resetPasswordFn() async {
      _formKey.currentState?.saveAndValidate(focusOnInvalid: true);
      if (_formKey.currentState!.isValid) {
        var data = _formKey.currentState!.value;

        final authBloc = BlocProvider.of<AuthBloc>(context);

        var newData = {...data, "email": authBloc.state};
        logger.i([data, newData]);

        setState(() => loading = true);
        var res = await AuthService().resetPassword(newData);
        setState(() => loading = false);

        res.$1 ? context.push(Routes.signIn) : Toastify.e(res.$2);
      }
    }

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(top: 10, left: 15),
          child: Back(),
        ),
      ),
      body: ResetPasswordView(
        _formKey,
        _resetCodeFieldKey,
        _passwordFieldKey,
        resetPasswordFn,
        loading,
      ),
    );
  }
}

// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:e_commerce/core/routes/router.dart';
import 'package:e_commerce/core/utils/toast.dart';
import 'package:e_commerce/features/auth/view/page/forgot_password/1-step/forgot_password_view.dart';
import 'package:e_commerce/core/widgets/back_button.dart';
import 'package:e_commerce/features/auth/viewModel/bloc/auth_bloc.dart';
import 'package:e_commerce/features/auth/viewModel/bloc/auth_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _emailFieldKey = GlobalKey<FormBuilderFieldState>();

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
    final authBloc = BlocProvider.of<AuthBloc>(context);
    Future<void> forgotPasswordFn() async {
      _formKey.currentState!.saveAndValidate(focusOnInvalid: false);
      if (_formKey.currentState!.isValid) {
        authBloc.add(AuthSaveEmail(_emailFieldKey.currentState?.value));
        context.push(Routes.forgotPassword.step2);
      }
    }

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(top: 10, left: 15),
          child: Back(),
        ),
      ),
      body: ForgotPasswordView(_formKey, _emailFieldKey, forgotPasswordFn),
    );
  }
}

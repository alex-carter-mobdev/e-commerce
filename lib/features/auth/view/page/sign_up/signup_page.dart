// ignore_for_file: no_leading_underscores_for_local_identifiers, use_build_context_synchronously
import 'package:e_commerce/core/routes/router.dart';
import 'package:e_commerce/core/utils/logger.dart';
import 'package:e_commerce/core/utils/toast.dart';

import 'package:e_commerce/features/auth/model/service/auth_service.dart';
import 'package:e_commerce/features/auth/view/page/sign_up/signup_view.dart';
import 'package:e_commerce/features/auth/view/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _emailFieldKey = GlobalKey<FormBuilderFieldState>();
  final _usernameFieldKey = GlobalKey<FormBuilderFieldState>();
  final _lastnameFieldKey = GlobalKey<FormBuilderFieldState>();
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
    Future<void> onPressed() async {
      _formKey.currentState?.saveAndValidate(focusOnInvalid: true);
      if (_formKey.currentState!.isValid) {
        var data = _formKey.currentState!.value;
        logger.i(data);

        setState(() => loading = true);
        var res = await AuthService().signUp(data);
        setState(() => loading = false);

        res.$1 ? context.go(Routes.aboutYourself) : Toastify.e(res.$2);
      }
    }

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(top: 10, left: 15),
          child: Back(),
        ),
      ),
      body: SignupView(
        _formKey,
        _emailFieldKey,
        _usernameFieldKey,
        _lastnameFieldKey,
        _passwordFieldKey,
        onPressed,
        loading,
      ),
    );
  }
}

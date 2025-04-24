// ignore_for_file: no_leading_underscores_for_local_identifiers, use_build_context_synchronously
import 'package:e_commerce/core/theme/routes.dart';
import 'package:e_commerce/core/utils/logger.dart';
import 'package:e_commerce/core/utils/toast.dart';

import 'package:e_commerce/features/auth/model/service/auth_service.dart';
import 'package:e_commerce/features/auth/view/page/sign_in/signin_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _emailFieldKey = GlobalKey<FormBuilderFieldState>();
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
    Future<void> singIn() async {
      _formKey.currentState?.saveAndValidate(focusOnInvalid: true);
      if (_formKey.currentState!.isValid) {
        var data = _formKey.currentState!.value;
        logger.i(data);

        setState(() => loading = true);
        var res = await AuthService().signIn(data);
        setState(() => loading = false);

        res.$1 ? context.goNamed(Routes.home) : Toastify.e(res.$2);
      }
    }

    Future<void> forgotPasswordFn() async {
      context.pushNamed(Routes.forgotPassword.step1);
    }

    Future<void> toSignUp() async {
      context.pushNamed(Routes.signUp);
    }

    return Scaffold(
      appBar: AppBar(),
      body: SigninView(
        _formKey,
        _emailFieldKey,
        _passwordFieldKey,
        singIn,
        toSignUp,
        forgotPasswordFn,
        loading,
      ),
    );
  }
}
// ! DioException [connection error]:
// ! The connection errored: Connection failed This indicates an error which most likely cannot solved by the library.
// ! Error SocketException Connection failed (OS Error: Permission denied, errno=13), address= 192.168.1.9, port=5000
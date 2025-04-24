// ignore_for_file: use_build_context_synchronously

import 'package:e_commerce/core/theme/routes.dart';
import 'package:e_commerce/core/utils/toast.dart';
import 'package:e_commerce/features/auth/model/service/auth_service.dart';
import 'package:e_commerce/features/auth/view/page/forgot_password/2-step/forgot_password_view.dart';
import 'package:e_commerce/features/auth/view/widgets/back_button.dart';
import 'package:e_commerce/features/auth/viewModel/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  bool loading = false;

  @override
  void initState() {
    super.initState();
    Toastify.init(context);
  }

  @override
  Widget build(BuildContext context) {
    Future<void> forgotPasswordFn() async {
      final authBloc = BlocProvider.of<AuthBloc>(context);

      Map<String, dynamic> data = {'email': authBloc.state};

      setState(() => loading = true);
      var res = await AuthService().forgotPassword(data);
      setState(() => loading = false);
      res.$1 ? context.pushNamed(Routes.resetPassword) : Toastify.e(res.$2);
    }

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(top: 10, left: 15),
          child: Back(),
        ),
      ),
      body: ForgotPasswordView(forgotPasswordFn, loading),
    );
  }
}

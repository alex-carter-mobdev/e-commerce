import 'package:e_commerce/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class ForgotPasswordView extends StatelessWidget {
  // final AuthState state;
  final bool loading;

  final void Function() forgotPasswordFn;

  const ForgotPasswordView(this.forgotPasswordFn, this.loading, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 24,
          children: [
            Image.asset('assets/images/email.png'),
            Text(
              'We Sent you an Email to reset your password.',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            PrimaryButton(
              'Continue',
              isLoading: loading,
              onPressed: forgotPasswordFn,
            ),
          ],
        ),
      ),
    );
  }
}

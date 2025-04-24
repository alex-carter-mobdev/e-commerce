import 'package:e_commerce/core/theme/color.dart';
import 'package:e_commerce/features/auth/view/widgets/input.dart';
import 'package:e_commerce/features/auth/view/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ResetPasswordView extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;
  final GlobalKey<FormBuilderFieldState> resetCodeFieldKey;
  final GlobalKey<FormBuilderFieldState> passwordFieldKey;

  final void Function() resetPasswordFn;
  final bool loading;

  const ResetPasswordView(
    this.formKey,
    this.resetCodeFieldKey,
    this.passwordFieldKey,
    this.resetPasswordFn,
    this.loading, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 23.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Reset Password',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),

              const SizedBox(height: 35),

              FormBuilder(
                key: formKey,
                autovalidateMode: AutovalidateMode.onUnfocus,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 16,
                  children: [
                    Input(
                      actionButttonText: TextInputAction.next,
                      type: TextInputType.text,
                      inputKey: resetCodeFieldKey,
                      name: 'resetCode',
                      labelText: "Enter code",
                    ),
                    Input(
                      actionButttonText: TextInputAction.go,
                      type: TextInputType.text,
                      inputKey: passwordFieldKey,
                      name: 'newPassword',
                      labelText: "Enter a new password",
                      isPassword: true,
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 14,
                          color: ThemeColor.black_100,
                        ),
                        children: [
                          TextSpan(text: 'If dont see the email, '),
                          TextSpan(
                            text: 'Open spam folder',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    PrimaryButton(
                      'Finish',
                      onPressed: resetPasswordFn,
                      isLoading: loading,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

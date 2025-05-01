import 'package:e_commerce/core/theme/color.dart';
import 'package:e_commerce/features/auth/view/widgets/input.dart';
import 'package:e_commerce/features/auth/view/widgets/primary_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class SigninView extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;
  final GlobalKey<FormBuilderFieldState> emailFieldKey;
  final GlobalKey<FormBuilderFieldState> passwordFieldKey;

  final void Function() signIn;
  final void Function() toSignUp;
  final void Function() forgotPasswordFn;
  final bool loading;

  const SigninView(
    this.formKey,
    this.emailFieldKey,
    this.passwordFieldKey,
    this.signIn,
    this.toSignUp,
    this.forgotPasswordFn,
    this.loading, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 27.0, right: 27.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Sign in',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),

              const SizedBox(height: 32),

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
                      inputKey: emailFieldKey,
                      name: 'email',
                      labelText: "Email",
                      validatorsList: [FormBuilderValidators.email()],
                    ),
                    Input(
                      actionButttonText: TextInputAction.go,
                      type: TextInputType.text,
                      inputKey: passwordFieldKey,
                      name: 'password',
                      labelText: "Password",
                      isPassword: true,
                    ),

                    RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: 'Forgot Password ? ',
                            style: TextStyle(fontWeight: FontWeight.w400),
                          ),
                          TextSpan(
                            text: 'Reset',
                            style: TextStyle(
                              // fontFamily: 'Gabarito',
                              fontWeight: FontWeight.w700,
                            ),
                            recognizer:
                                TapGestureRecognizer()
                                  ..onTap = forgotPasswordFn,
                          ),
                        ],
                      ),
                    ),

                    PrimaryButton(
                      'Continue',

                      isFullsize: true,
                      isLoading: loading,
                      onPressed: signIn,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 13.5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 19.5,
                        children: [
                          Divider(color: ThemeColor.primary, thickness: 3),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(color: Colors.black),
                              children: [
                                TextSpan(
                                  text: 'Dont have an Account ? ',
                                  style: TextStyle(fontWeight: FontWeight.w400),
                                ),
                                TextSpan(
                                  text: 'Create One',
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                  recognizer:
                                      TapGestureRecognizer()..onTap = toSignUp,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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

// Utilities: Error in unawaited Future:Error: WipError -32000 Execution was terminated
// Failed to set DevTools server address: ext.flutter.activeDevToolsServerAddress: (-32603) Unexpected DWDS error for callServiceExtension: WipError -32000 Cannot find context with specified id. Deep links to DevTools will not show in Flutter errors.
// ext.flutter.connectedVmServiceUri: (-32603) Unexpected DWDS error for callServiceExtension: WipError -32000 Cannot find context with specified id
// Failed to set vm service URI: ext.flutter.connectedVmServiceUri: (-32603) Unexpected DWDS error for callServiceExtension: WipError -32000 Cannot find context with specified id. Deep links to DevTools will not show in Flutter errors.
// Failed to set DevTools server address: ext.flutter.activeDevToolsServerAddress: (-32603) Unexpected DWDS error for callServiceExtension: WipError -32000 Cannot find context with specified id. Deep links to DevTools will not show in Flutter errors.
// ext.flutter.connectedVmServiceUri: (-32603) Unexpected DWDS error for callServiceExtension: WipError -32000 Cannot find context with specified id
// Failed to set vm service URI: ext.flutter.connectedVmServiceUri: (-32603) Unexpected DWDS error for callServiceExtension: WipError -32000 Cannot find context with specified id. Deep links to DevTools will not show in Flutter errors.

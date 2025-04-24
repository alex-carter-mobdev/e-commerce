import 'package:e_commerce/features/auth/view/widgets/input.dart';
import 'package:e_commerce/features/auth/view/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class ForgotPasswordView extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;
  final GlobalKey<FormBuilderFieldState> emailFieldKey;

  final void Function() forgotPasswordFn;

  const ForgotPasswordView(
    this.formKey,
    this.emailFieldKey,
    this.forgotPasswordFn, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Forgot Password',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),

              const SizedBox(height: 35),

              FormBuilder(
                key: formKey,
                autovalidateMode: AutovalidateMode.onUnfocus,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 24,
                  children: [
                    Input(
                      actionButttonText: TextInputAction.go,
                      type: TextInputType.text,
                      inputKey: emailFieldKey,
                      name: 'email',
                      labelText: "Email",
                      validatorsList: [FormBuilderValidators.email()],
                    ),

                    PrimaryButton('Continue', onPressed: forgotPasswordFn),
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

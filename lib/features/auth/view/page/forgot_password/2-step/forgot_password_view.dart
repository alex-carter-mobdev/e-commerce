import 'package:e_commerce/features/auth/view/widgets/primary_button.dart';
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

// !SvgPicture.asset('/')
// Utilities: Error in unawaited Future:Error: WipError -32000 Execution was terminated
// Failed to set DevTools server address: ext.flutter.activeDevToolsServerAddress: (-32603) Unexpected DWDS error for callServiceExtension: WipError -32000 Cannot find context with specified id. Deep links to DevTools will not show in Flutter errors.
// ext.flutter.connectedVmServiceUri: (-32603) Unexpected DWDS error for callServiceExtension: WipError -32000 Cannot find context with specified id
// Failed to set vm service URI: ext.flutter.connectedVmServiceUri: (-32603) Unexpected DWDS error for callServiceExtension: WipError -32000 Cannot find context with specified id. Deep links to DevTools will not show in Flutter errors.
// Failed to set DevTools server address: ext.flutter.activeDevToolsServerAddress: (-32603) Unexpected DWDS error for callServiceExtension: WipError -32000 Cannot find context with specified id. Deep links to DevTools will not show in Flutter errors.
// ext.flutter.connectedVmServiceUri: (-32603) Unexpected DWDS error for callServiceExtension: WipError -32000 Cannot find context with specified id
// Failed to set vm service URI: ext.flutter.connectedVmServiceUri: (-32603) Unexpected DWDS error for callServiceExtension: WipError -32000 Cannot find context with specified id. Deep links to DevTools will not show in Flutter errors.

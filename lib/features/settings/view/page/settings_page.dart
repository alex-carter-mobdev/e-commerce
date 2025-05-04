import 'package:e_commerce/core/storage/auth_local_storage.dart';
import 'package:e_commerce/core/theme/router.dart';
import 'package:e_commerce/core/utils/logger.dart';
import 'package:e_commerce/core/utils/toast.dart';
import 'package:e_commerce/features/settings/model/settings_service.dart';
import 'package:e_commerce/features/settings/view/page/settings_view.dart';
import 'package:e_commerce/features/settings/view/widgets/popup.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool loading = false;
  Map<String, dynamic>? data;

  void getProfileData() async {
    var res = await SettingsService().getProfileData();

    if (res.$1) {
      logger.i(res);
      setState(() => data = res.$3);
      logger.i(data);
    } else {
      Toastify.e(res.$2);
    }
  }

  @override
  void initState() {
    super.initState();
    Toastify.init(context);
    getProfileData();
  }

  onEditPressed() {
    showDialog(context: context, builder: (context) => Popup(getProfileData));
  }

  onSignOutPressed() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Are u sure to delete this profile?'),
            actions: [
              TextButton(
                onPressed: () {
                  context.pop();
                },
                child: Text('No!'),
              ),
              TextButton(
                onPressed: () {
                  AuthLocalStorage().delete();
                  context.go(Routes.signIn);
                },
                child: Text('Yes!'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String firstName = data?['firstName'] ?? '';
    String lastName = data?['lastName'] ?? '';
    String email = data?['email'] ?? '';

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SettingsView(
          firstName,
          lastName,
          email,
          onEditPressed: onEditPressed,
          onSignOutPressed: onSignOutPressed,
        ),
      ),
    );
  }
}

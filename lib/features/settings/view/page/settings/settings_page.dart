import 'package:e_commerce/core/storage/auth_local_storage.dart';
import 'package:e_commerce/core/theme/router.dart';
import 'package:e_commerce/core/utils/toast.dart';
import 'package:e_commerce/features/auth/model/service/auth_service.dart';
import 'package:e_commerce/features/settings/model/settings_service.dart';
import 'package:e_commerce/features/settings/view/page/settings/settings_view.dart';
import 'package:e_commerce/features/settings/view/widgets/popup.dart';
import 'package:e_commerce/core/bloc/user_bloc.dart';
import 'package:e_commerce/core/bloc/user_event.dart';
import 'package:e_commerce/core/bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool loading = false;
  User? user;

  void getUserData(user) async {
    var res = await SettingsService().getUserData();
    var data = res.$3;
    if (res.$1) {
      user.add(
        SetUserData(
          id: data!['id'] as String?,
          firstName: data['firstName'] as String?,
          lastName: data['lastName'] as String?,
          email: data['email'] as String?,
          age: data['age'] as int?,
          gender: data['gender'] as String?,

          addresses:
              (data['addresses'] as List?)
                  ?.map((e) => Map<String, String>.from(e))
                  .toList(),
          payments:
              (data['payments'] as List?)
                  ?.map((e) => Map<String, String>.from(e))
                  .toList(),
          favorites:
              (data['favorites'] as List?)
                  ?.map((e) => Map<String, String>.from(e))
                  .toList(),
        ),
      );
    } else {
      Toastify.e(res.$2);
    }
  }

  @override
  void initState() {
    super.initState();
    Toastify.init(context);
    user = BlocProvider.of<User>(context);
    getUserData(user);
  }

  @override
  Widget build(BuildContext context) {
    void popUpSave(formKey) async {
      formKey.currentState!.saveAndValidate(focusOnInvalid: true);
      if (formKey.currentState!.isValid) {
        Map<String, dynamic> value = formKey.currentState!.value;
        var result = await AuthService().updateUserData(value);

        result.$1 ? context.pop() : Toastify.e(result.$2);
        getUserData(user);
      }
    }

    onEditPressed() {
      showDialog(context: context, builder: (context) => Popup(popUpSave));
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

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: BlocBuilder<User, UserState>(
          bloc: user,
          builder: (context, state) {
            String firstName = state.firstName;
            String lastName = state.lastName;
            String email = state.email;

            return SettingsView(
              firstName,
              lastName,
              email,
              onEditPressed: onEditPressed,
              onSignOutPressed: onSignOutPressed,
            );
          },
        ),
      ),
    );
  }
}

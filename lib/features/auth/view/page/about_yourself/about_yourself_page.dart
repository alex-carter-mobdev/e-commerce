// ignore_for_file: use_build_context_synchronously

import 'package:e_commerce/core/routes/router.dart';
import 'package:e_commerce/core/utils/logger.dart';
import 'package:e_commerce/core/utils/toast.dart';

import 'package:e_commerce/features/auth/model/service/auth_service.dart';
import 'package:e_commerce/features/auth/view/page/about_yourself/about_yourself_view.dart';
import 'package:e_commerce/features/auth/view/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';

class AboutYourselfPage extends StatefulWidget {
  const AboutYourselfPage({super.key});

  @override
  State<AboutYourselfPage> createState() => _AboutYourselfPageState();
}

class _AboutYourselfPageState extends State<AboutYourselfPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _ageKey = GlobalKey<FormBuilderFieldState>();
  bool loading = false;
  String gender = 'null';

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

      if (gender == 'null') {
        setState(() => gender = "empty");
      }
      if (_formKey.currentState!.isValid &&
          gender != 'null' &&
          gender != 'empty') {
        Map<String, dynamic> data = {
          'age': _ageKey.currentState!.value,
          'gender': gender,
        };
        logger.i(data);

        setState(() => loading = true);
        var res = await AuthService().updateUserData(data);
        setState(() => loading = false);

        res.$1 ? context.go(Routes.home) : Toastify.e(res.$2);
      }
    }

    void maleOption() {
      setState(() => gender = 'male');
    }

    void femaleOption() {
      setState(() => gender = 'female');
    }

    return Scaffold(
      appBar: AppBar(),

      body: AboutYourselfView(
        _formKey,
        _ageKey,
        maleOption,
        femaleOption,
        gender,
        loading,
      ),
      persistentFooterButtons: [PrimaryButton('Finish', onPressed: onPressed)],
    );
  }
}

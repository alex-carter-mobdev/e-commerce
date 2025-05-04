import 'package:e_commerce/core/utils/toast.dart';
import 'package:e_commerce/features/auth/model/service/auth_service.dart';
import 'package:e_commerce/features/auth/view/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

class Popup extends StatefulWidget {
  const Popup(this.getProfileData, {super.key});

  final void Function() getProfileData;

  @override
  State<Popup> createState() => _PopupState();
}

class _PopupState extends State<Popup> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _firstNameKey = GlobalKey<FormBuilderFieldState>();
  final _lastNameKey = GlobalKey<FormBuilderFieldState>();
  final _emailKey = GlobalKey<FormBuilderFieldState>();

  @override
  void dispose() {
    super.dispose();
    _formKey.currentState?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(20),
        // constraints: BoxConstraints(maxHeight: 600),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 20,
            children: [
              Text('Edit your profile setting', style: TextStyle(fontSize: 20)),

              FormBuilder(
                autovalidateMode: AutovalidateMode.onUnfocus,
                key: _formKey,
                child: Column(
                  spacing: 10,
                  children: [
                    Input(
                      inputKey: _firstNameKey,
                      name: 'firstName',
                      labelText: 'First name',
                      type: TextInputType.text,
                    ),
                    Input(
                      inputKey: _lastNameKey,
                      name: 'lastName',
                      labelText: 'Last name',
                      type: TextInputType.text,
                    ),
                    Input(
                      inputKey: _emailKey,
                      name: 'email',
                      labelText: 'Your email',
                      type: TextInputType.text,
                      validatorsList: [FormBuilderValidators.email()],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => context.pop(),
                    child: Text('Close'),
                  ),
                  TextButton(
                    onPressed: () async {
                      _formKey.currentState!.saveAndValidate(
                        focusOnInvalid: true,
                      );
                      if (_formKey.currentState!.isValid) {
                        Map<String, dynamic> value =
                            _formKey.currentState!.value;
                        var result = await AuthService().updateUserData(value);

                        result.$1 ? context.pop() : Toastify.e(result.$2);
                        widget.getProfileData();
                      }
                    },
                    child: Text('Edit'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

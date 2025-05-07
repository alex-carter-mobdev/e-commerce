import 'package:e_commerce/features/auth/view/widgets/input.dart';
import 'package:e_commerce/features/auth/view/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AddressAddEditView extends StatelessWidget {
  const AddressAddEditView(
    this.formKey,
    this.streetAddressKey,
    this.cityKey,
    this.stateKey,
    this.zipCodeKey,
    this.querryParameters, {
    super.key,
    required this.onSave,
  });

  final GlobalKey<FormBuilderState> formKey;
  final GlobalKey<FormBuilderFieldState> streetAddressKey;
  final GlobalKey<FormBuilderFieldState> cityKey;
  final GlobalKey<FormBuilderFieldState> stateKey;
  final GlobalKey<FormBuilderFieldState> zipCodeKey;

  final Map<String, String> querryParameters;

  final void Function() onSave;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 42, left: 24, bottom: 24, right: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FormBuilder(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUnfocus,
            child: Column(
              spacing: 12,
              children: [
                Input(
                  inputKey: streetAddressKey,
                  name: 'street',
                  labelText: 'Street Address',
                  type: TextInputType.text,
                  initialValue: querryParameters['street'],
                ),
                Input(
                  inputKey: cityKey,
                  name: 'city',
                  labelText: 'City',
                  type: TextInputType.text,
                  initialValue: querryParameters['city'],
                ),
                Row(
                  spacing: 20,
                  children: [
                    Expanded(
                      child: Input(
                        inputKey: stateKey,
                        name: 'state',
                        labelText: 'State',
                        type: TextInputType.text,
                        initialValue: querryParameters['state'],
                      ),
                    ),
                    Expanded(
                      child: Input(
                        inputKey: zipCodeKey,
                        name: 'zipCode',
                        labelText: 'Zip Code',
                        type: TextInputType.text,
                        initialValue: querryParameters['zipCode'],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          PrimaryButton('Save', onPressed: onSave),
        ],
      ),
    );
  }
}

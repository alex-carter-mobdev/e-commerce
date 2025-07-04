import 'package:e_commerce/core/utils/logger.dart';
import 'package:e_commerce/core/widgets/input.dart';
import 'package:e_commerce/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class PaymentsAddEditView extends StatelessWidget {
  const PaymentsAddEditView(
    this.formKey,
    this.cardNumberKey,
    this.ccvKey,
    this.expKey,
    this.cardholderNameKey,
    this.querryParameters, {
    super.key,
    required this.onSave,
  });

  final GlobalKey<FormBuilderState> formKey;
  final GlobalKey<FormBuilderFieldState> cardNumberKey;
  final GlobalKey<FormBuilderFieldState> ccvKey;
  final GlobalKey<FormBuilderFieldState> expKey;
  final GlobalKey<FormBuilderFieldState> cardholderNameKey;

  final Map<String, String> querryParameters;

  final void Function() onSave;

  @override
  Widget build(BuildContext context) {
    logger.i(querryParameters);
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
                  inputKey: cardNumberKey,
                  name: 'cardNumber',
                  labelText: 'Card number',
                  type: TextInputType.text,
                  initialValue: querryParameters['cardNumber'],
                ),
                Row(
                  spacing: 20,
                  children: [
                    Expanded(
                      child: Input(
                        inputKey: expKey,
                        name: 'expireDate',
                        labelText: 'exp',
                        type: TextInputType.text,
                        initialValue: querryParameters['exp'],
                      ),
                    ),
                    Expanded(
                      child: Input(
                        inputKey: ccvKey,
                        name: 'ccv',
                        labelText: 'ccv',
                        type: TextInputType.text,
                        initialValue: querryParameters['ccv'],
                      ),
                    ),
                  ],
                ),
                Input(
                  inputKey: cardholderNameKey,
                  name: 'cardName',
                  labelText: 'cardholder Name',
                  type: TextInputType.text,
                  initialValue: querryParameters['cardholderName'],
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

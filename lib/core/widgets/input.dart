import 'package:e_commerce/core/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class Input extends StatelessWidget {
  const Input({
    super.key,
    required this.inputKey,
    this.validatorsList,
    required this.name,
    required this.labelText,
    this.isPassword,
    required this.type,
    this.actionButttonText,
    this.initialValue,
    this.fullBorderRadius,
  });

  final GlobalKey<FormBuilderFieldState> inputKey;
  final List<FormFieldValidator<String>>? validatorsList;
  final String name;
  final TextInputType type;
  final String labelText;
  final bool? isPassword;
  final bool? fullBorderRadius;
  final TextInputAction? actionButttonText;

  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      initialValue: initialValue,
      keyboardType: type,
      textInputAction: actionButttonText,
      key: inputKey,
      name: name,
      style: TextStyle(color: ThemeColor.black_100),

      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: ThemeColor.black_50.withAlpha(255 ~/ 2)),
        filled: true,
        fillColor: ThemeColor.secondary,

        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(
            fullBorderRadius ?? false ? 1000 : 5,
          ),
        ),
      ),
      validator: FormBuilderValidators.compose(
        validatorsList == null
            ? [FormBuilderValidators.required()]
            : [FormBuilderValidators.required(), ...?validatorsList],
      ),
      obscureText: isPassword ?? false,
    );
  }
}

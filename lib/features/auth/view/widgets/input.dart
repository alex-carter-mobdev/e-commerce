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
  });

  final GlobalKey<FormBuilderFieldState> inputKey;
  final List<FormFieldValidator<String>>? validatorsList;
  final String name;
  final TextInputType type;
  final String labelText;
  final bool? isPassword;
  final TextInputAction? actionButttonText;

  @override
  Widget build(BuildContext context) {
    Color none = Colors.transparent;
    return FormBuilderTextField(
      keyboardType: type,
      textInputAction: actionButttonText,
      key: inputKey,
      name: name,
      style: TextStyle(color: ThemeColor.black_50),

      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: ThemeColor.black_50.withAlpha(255 ~/ 2)),
        filled: true,
        fillColor: ThemeColor.bg_light,

        // Background colors
        floatingLabelStyle: TextStyle(color: ThemeColor.black_50),
        border: OutlineInputBorder(borderSide: BorderSide(color: none)),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: none)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: none)),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: none), // Visible error border
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: none), // Visible error border
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

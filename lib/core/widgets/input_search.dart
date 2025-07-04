// ignore_for_file: avoid_unnecessary_containers

import 'package:e_commerce/core/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InputSearch extends StatelessWidget {
  final String name;
  final GlobalKey<FormBuilderFieldState> inputKey;

  final String hintText;
  final List<FormFieldValidator<String>>? validatorsList;
  final void Function(String?)? onSubmitted;
  final void Function(String?)? onChanged;
  final Widget? suffixIcon;

  const InputSearch({
    super.key,
    required this.name,
    required this.inputKey,
    required this.hintText,
    required this.onSubmitted,
    this.validatorsList,
    this.suffixIcon,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      key: inputKey,
      decoration: InputDecoration(
        hintText: hintText,

        prefixIcon: Container(
          padding: const EdgeInsets.only(left: 19, right: 8),
          height: 16,
          width: 16,
          child: SvgPicture.asset('icons/search.svg'),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(100),
        ),
        fillColor: ThemeColor.secondary,
        filled: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 19, vertical: 10),
        suffixIcon: suffixIcon,
      ),
      onSubmitted: onSubmitted,
      onChanged: onChanged,
    );
  }
}

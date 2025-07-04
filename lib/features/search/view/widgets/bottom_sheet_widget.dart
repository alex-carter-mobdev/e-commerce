import 'package:e_commerce/core/theme/color.dart';
import 'package:e_commerce/core/utils/logger.dart';
import 'package:e_commerce/core/widgets/input.dart';
import 'package:e_commerce/core/widgets/primary_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({
    super.key,
    required this.name,
    required this.filterList,
    required this.onSelected,
    required this.state,
    this.isPrice,
    required this.formKey,
    required this.onClose,
    required this.minFieldKey,
    required this.maxFieldKey,
  });
  final String name;
  final dynamic state;
  final List<String> filterList;
  final void Function(String) onSelected;
  final bool? isPrice;

  final GlobalKey<FormBuilderState> formKey;
  final GlobalKey<FormBuilderFieldState> minFieldKey;
  final GlobalKey<FormBuilderFieldState> maxFieldKey;
  final void Function(Map<String, dynamic>? values)? onClose;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 26, top: 19, right: 34),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  'Clear',
                  style: TextStyle(fontSize: 16, color: ThemeColor.black_100),
                ),
              ),
              Text(
                name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () {
                  formKey.currentState?.saveAndValidate();
                  onClose?.call(formKey.currentState?.value);
                  Navigator.of(context).pop();
                },
                icon: SvgPicture.asset('assets/icons/cross.svg'),
              ),
            ],
          ),
          SizedBox(height: 28),
          Column(
            spacing: 16,
            children: [
              isPrice ?? false
                  ? FormBuilder(
                    autovalidateMode: AutovalidateMode.onUnfocus,
                    key: formKey,
                    child: Column(
                      spacing: 16,
                      children: [
                        Input(
                          inputKey: minFieldKey,
                          name: 'min', // TODO: set key's value
                          labelText: 'min',
                          type: TextInputType.number,
                          initialValue: state.isNotEmpty ? state[0] : null,
                          validatorsList: [FormBuilderValidators.integer()],
                          fullBorderRadius: true,
                        ),
                        Input(
                          inputKey: maxFieldKey,
                          name: 'max', // TODO: set key's value
                          labelText: 'max',
                          initialValue: state.isNotEmpty ? state[1] : null,
                          type: TextInputType.number,
                          validatorsList: [FormBuilderValidators.integer()],
                          fullBorderRadius: true,
                        ),
                      ],
                    ),
                  )
                  : ListView.builder(
                    shrinkWrap: true,
                    itemCount: filterList.length,
                    itemBuilder: (context, index) {
                      String e = filterList[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: PrimaryButton(
                          e,
                          isActive: e == state,
                          showTickIcon: e == state,
                          onPressed: () => onSelected(e),
                        ),
                      );
                    },
                  ),
            ],
          ),
        ],
      ),
    );
  }
}

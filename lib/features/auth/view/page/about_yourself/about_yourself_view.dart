import 'package:e_commerce/features/auth/view/widgets/input.dart';
import 'package:e_commerce/features/auth/view/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class AboutYourselfView extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;
  final GlobalKey<FormBuilderFieldState> ageFieldKey;
  final void Function() maleOption;
  final void Function() femaleOption;
  final bool loading;
  final String gender;

  const AboutYourselfView(
    this.formKey,
    this.ageFieldKey,
    this.maleOption,
    this.femaleOption,
    this.gender,
    this.loading, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 27.0, right: 27.0, top: 58.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tell us About yourself',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(height: 49),
            Text('Who do you shop for ?', style: TextStyle(fontSize: 16)),
            SizedBox(height: 23),
            FormBuilder(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUnfocus,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    spacing: 20,
                    children: [
                      Expanded(
                        child: PrimaryButton(
                          'Male',
                          isFullsize: false,
                          isActive: gender == 'male',
                          onPressed: maleOption,
                        ),
                      ),
                      Expanded(
                        child: PrimaryButton(
                          'Female',
                          isFullsize: false,
                          isActive: gender == 'female',
                          onPressed: femaleOption,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: gender == 'null' ? 10 : 0),
                  gender == "empty"
                      ? Text(
                        'Please, select your gender!',
                        style: TextStyle(color: Colors.red, fontSize: 14),
                      )
                      : SizedBox(),
                  SizedBox(height: 56),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 13,
                    children: [
                      Text('How Old are you ?', style: TextStyle(fontSize: 16)),
                      Input(
                        actionButttonText: TextInputAction.go,
                        type: TextInputType.number,
                        inputKey: ageFieldKey,
                        name: 'age',
                        labelText: "Age",

                        validatorsList: [
                          FormBuilderValidators.numeric(),
                          FormBuilderValidators.positiveNumber(),
                          FormBuilderValidators.range(
                            5,
                            100,
                            errorText: 'Please, provide your correct age!',
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class ErrorText extends StatelessWidget {
//   final String gender;

//   const ErrorText(this.gender, {super.key});

//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }

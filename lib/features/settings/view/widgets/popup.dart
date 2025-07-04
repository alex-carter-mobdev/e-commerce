import 'package:e_commerce/core/widgets/input.dart';
import 'package:e_commerce/core/bloc/user_bloc.dart';
import 'package:e_commerce/core/bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';

class Popup extends StatefulWidget {
  const Popup(this.popUpSave, {super.key});

  final void Function(dynamic) popUpSave;

  @override
  State<Popup> createState() => _PopupState();
}

class _PopupState extends State<Popup> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _firstNameKey = GlobalKey<FormBuilderFieldState>();
  final _lastNameKey = GlobalKey<FormBuilderFieldState>();

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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 20,
          children: [
            Text('Edit your profile setting', style: TextStyle(fontSize: 20)),

            FormBuilder(
              autovalidateMode: AutovalidateMode.onUnfocus,
              key: _formKey,
              child: BlocBuilder<User, UserState>(
                builder:
                    (context, state) => Column(
                      spacing: 10,
                      children: [
                        Input(
                          inputKey: _firstNameKey,
                          initialValue: state.firstName,
                          name: 'firstName',
                          labelText: 'First name',
                          type: TextInputType.text,
                        ),
                        Input(
                          initialValue: state.lastName,
                          inputKey: _lastNameKey,
                          name: 'lastName',
                          labelText: 'Last name',
                          type: TextInputType.text,
                        ),
                      ],
                    ),
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
                  onPressed: () => widget.popUpSave(_formKey),
                  child: Text('Edit'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

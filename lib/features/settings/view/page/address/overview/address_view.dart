import 'package:e_commerce/core/bloc/user_bloc.dart';
import 'package:e_commerce/core/bloc/user_state.dart';
import 'package:e_commerce/features/auth/view/widgets/primary_button.dart';
import 'package:e_commerce/features/settings/view/widgets/tile_edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressView extends StatefulWidget {
  const AddressView({super.key, required this.onAdd, required this.onEdit});

  final void Function() onAdd;
  final void Function(String, String, String, String, String) onEdit;

  @override
  State<AddressView> createState() => _AddressViewState();
}

class _AddressViewState extends State<AddressView> {
  @override
  Widget build(BuildContext context) {
    final user = BlocProvider.of<User>(context);
    RegExp regex = RegExp(r'^(street|city|state|zipCode)$');
    Map addressValue;

    return Container(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Expanded(
            child: BlocBuilder<User, UserState>(
              bloc: user,
              builder: (context, state) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.addresses.length,
                  itemBuilder: (context, index) {
                    dynamic id = state.addresses[index]['_id'] ?? '';
                    String street = state.addresses[index]['street'] ?? '';
                    String city = state.addresses[index]['city'] ?? '';
                    String stateOfUser = state.addresses[index]['state'] ?? '';
                    String zipCode = state.addresses[index]['zipCode'] ?? '';

                    addressValue = state.addresses[index];
                    addressValue.removeWhere(
                      (key, value) => !regex.hasMatch(key),
                    );
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: TileEdit(
                        subtitle: addressValue.values.join(' '),
                        onPressed: () {
                          return widget.onEdit(
                            id,
                            street,
                            city,
                            stateOfUser,
                            zipCode,
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),

          PrimaryButton('Add', onPressed: widget.onAdd),
        ],
      ),
    );
  }
}

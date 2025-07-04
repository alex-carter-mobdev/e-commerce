import 'package:e_commerce/core/bloc/user_bloc.dart';
import 'package:e_commerce/core/bloc/user_state.dart';
import 'package:e_commerce/core/widgets/primary_button.dart';
import 'package:e_commerce/features/settings/view/widgets/tile_edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressView extends StatelessWidget {
  const AddressView({
    super.key,
    required this.onAdd,
    required this.onEdit,
    required this.onDelete,
  });

  final void Function() onAdd;
  final void Function(String, String, String, String, String) onEdit;
  final void Function(String) onDelete;

  @override
  Widget build(BuildContext context) {
    final user = BlocProvider.of<User>(context);
    RegExp regex = RegExp(r'^(street|city|state|zipCode)$');
    Map addressValue;

    return Padding(
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
                        onEditPressed: () {
                          return onEdit(id, street, city, stateOfUser, zipCode);
                        },
                        onDeletePressed: () => onDelete(id),
                      ),
                    );
                  },
                );
              },
            ),
          ),

          PrimaryButton('Add', onPressed: onAdd),
        ],
      ),
    );
  }
}

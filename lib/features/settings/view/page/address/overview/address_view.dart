import 'package:e_commerce/core/utils/logger.dart';
import 'package:e_commerce/features/auth/view/widgets/primary_button.dart';
import 'package:e_commerce/features/settings/view/widgets/tile_edit.dart';
import 'package:flutter/material.dart';

class AddressView extends StatelessWidget {
  const AddressView(
    this.address, {
    super.key,
    required this.onAdd,
    required this.onEdit,
  });

  final List<Map> address;
  final void Function() onAdd;
  final void Function(String, String, String, String, String) onEdit;

  @override
  Widget build(BuildContext context) {
    var isEmpty = address.first.values.toList().join(' ') == '';

    return Container(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: isEmpty ? 0 : address.length,
            itemBuilder: (context, index) {
              RegExp regex = RegExp(r'^(street|city|state|zipCode)$');
              String subTitle = '';
              address[index].forEach(
                (key, value) =>
                    subTitle += regex.hasMatch(key) ? "$value " : '',
              );
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: TileEdit(
                  subtitle: subTitle,
                  onPressed: () {
                    logger.i(address);
                    String id = address[index]['_id'].toString();
                    String street = address[index]['street'] ?? '';
                    String city = address[index]['city'] ?? '';
                    String state = address[index]['state'] ?? '';
                    String zipCode = address[index]['zipCode'] ?? '';

                    return onEdit(id, street, city, state, zipCode);
                  },
                ),
              );
            },
          ),
          PrimaryButton('Add', onPressed: onAdd),
        ],
      ),
    );
  }
}

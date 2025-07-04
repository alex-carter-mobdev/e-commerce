import 'package:e_commerce/features/settings/view/widgets/tile_edit.dart';
import 'package:flutter/material.dart';

class SelectAddressView extends StatelessWidget {
  const SelectAddressView({super.key, required this.list, required this.onTap});
  final List<Map<String, String>> list;
  final void Function(int index) onTap;
  static late Map addressValue;
  static RegExp regex = RegExp(r'^(street|city|state|zipCode)$');

  @override
  Widget build(BuildContext context) {
    return list.isEmpty
        ? Center(child: Text('Loading...'))
        : ListView.builder(
          shrinkWrap: true,
          itemCount: list.length,
          itemBuilder: (context, index) {
            addressValue = list[index];
            addressValue.removeWhere((key, value) => !regex.hasMatch(key));
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: TileEdit(
                subtitle: addressValue.values.join(' '),
                onTap: () => onTap(index),
              ),
            );
          },
        );
  }
}

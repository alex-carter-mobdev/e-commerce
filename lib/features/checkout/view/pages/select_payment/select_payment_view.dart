import 'package:e_commerce/features/settings/view/widgets/tile_edit.dart';
import 'package:flutter/material.dart';

class SelectPaymentView extends StatelessWidget {
  const SelectPaymentView({super.key, required this.list, required this.onTap});
  final List<Map<String, String>> list;
  final void Function(int index) onTap;
  static late Map paymantValue;
  static RegExp regex = RegExp(r'^(cardNumber|cardName|ccv|expireDate)$');

  @override
  Widget build(BuildContext context) {
    return list.isEmpty
        ? Center(child: Text('Loading...'))
        : ListView.builder(
          shrinkWrap: true,
          itemCount: list.length,
          itemBuilder: (context, index) {
            paymantValue = list[index];
            paymantValue.removeWhere((key, value) => !regex.hasMatch(key));
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: TileEdit(
                subtitle: paymantValue.values.join(' '),
                onTap: () => onTap(index),
              ),
            );
          },
        );
  }
}

import 'package:e_commerce/core/bloc/user_bloc.dart';
import 'package:e_commerce/core/bloc/user_state.dart';
import 'package:e_commerce/features/auth/view/widgets/primary_button.dart';
import 'package:e_commerce/features/settings/view/widgets/tile_edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentsView extends StatefulWidget {
  const PaymentsView({
    super.key,
    required this.onAdd,
    required this.onEdit,
    required this.onDelete,
  });

  final void Function() onAdd;
  final void Function(String, String, String, String, String) onEdit;
  final void Function(String) onDelete;

  @override
  State<PaymentsView> createState() => _PaymentsViewState();
}

class _PaymentsViewState extends State<PaymentsView> {
  @override
  Widget build(BuildContext context) {
    final user = BlocProvider.of<User>(context);
    RegExp regex = RegExp(r'^(cardNumber|ccv|exp|cardholderName)$');
    Map paymentsValue;

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
                  itemCount: state.payments.length,
                  itemBuilder: (context, index) {
                    dynamic id = state.payments[index]['_id'] ?? '';
                    String cardNumber =
                        state.payments[index]['cardNumber'] ?? '';
                    String ccv = state.payments[index]['ccv'] ?? '';
                    String exp = state.payments[index]['exp'] ?? '';
                    String cardholderName =
                        state.payments[index]['cardholderName'] ?? '';

                    paymentsValue = state.payments[index];
                    paymentsValue.removeWhere(
                      (key, value) => !regex.hasMatch(key),
                    );
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: TileEdit(
                        subtitle: paymentsValue.values.join(' '),
                        onEditPressed: () {
                          return widget.onEdit(
                            id,
                            cardNumber,
                            ccv,
                            exp,
                            cardholderName,
                          );
                        },
                        onDeletePressed: () => widget.onDelete(id),
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

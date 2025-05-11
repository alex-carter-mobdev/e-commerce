import 'package:e_commerce/core/theme/router.dart';
import 'package:e_commerce/features/auth/view/widgets/back_button.dart';
import 'package:e_commerce/features/settings/view/page/address/overview/address_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    void onAdd() {
      context.push("${Routes.address}/:add");
    }

    void onEdit(
      String id,
      String street,
      String city,
      String state,
      String zipCode,
    ) {
      var path =
          "${Routes.address}/$id?street=$street&city=$city&state=$state&zipCode=$zipCode";
      context.push(path);
    }

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        leading: Padding(
          padding: const EdgeInsets.only(left: 27, bottom: 5),
          child: Back(),
        ),
        title: Text('Address'),
        centerTitle: true,
      ),
      body: AddressView(onAdd: onAdd, onEdit: onEdit),
    );
  }
}

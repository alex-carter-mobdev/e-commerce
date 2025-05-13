import 'package:e_commerce/core/bloc/user_bloc.dart';
import 'package:e_commerce/core/bloc/user_event.dart';
import 'package:e_commerce/core/theme/router.dart';
import 'package:e_commerce/core/utils/toast.dart';
import 'package:e_commerce/features/auth/view/widgets/back_button.dart';
import 'package:e_commerce/features/settings/model/settings_service.dart';
import 'package:e_commerce/features/settings/view/page/address/overview/address_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  @override
  void initState() {
    super.initState();
    Toastify.init(context);
  }

  @override
  Widget build(BuildContext context) {
    final user = BlocProvider.of<User>(context);

    void onAdd() {
      context.push("${Routes.address}/:add");
    }

    void onDelete(String id) async {
      var res = await SettingsService().deleteAddress(id);

      res.$1 ? user.add(ReFetchUserData()) : Toastify.e(res.$2);
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
      body: AddressView(onAdd: onAdd, onEdit: onEdit, onDelete: onDelete),
    );
  }
}

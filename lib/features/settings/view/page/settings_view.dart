import 'package:e_commerce/core/theme/color.dart';
import 'package:e_commerce/features/settings/view/widgets/tile.dart';
import 'package:e_commerce/features/settings/view/widgets/tile_edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SettingsView extends StatelessWidget {
  const SettingsView(
    this.firstName,
    this.lastName,
    this.email, {
    super.key,
    required this.onEditPressed,
    required this.onSignOutPressed,
  });

  final String firstName;
  final String lastName;
  final String email;
  final void Function() onEditPressed;
  final void Function() onSignOutPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SvgPicture.asset('assets/icons/user_icon.svg'),
          SizedBox(height: 19),
          TileEdit(
            title: '$firstName $lastName',
            subtitle: email,
            onPressed: onEditPressed,
          ),
          SizedBox(height: 24),
          Column(
            spacing: 8,
            children: [
              // TODO: add address, favourites, payment page
              Tile(location: '/address', name: 'Address'),
              Tile(location: '/favourites', name: 'Favourites'),
              Tile(location: '/payment', name: 'Payment'),
              Tile(location: null, name: 'Help'),
              Tile(location: null, name: 'Support'),
            ],
          ),
          SizedBox(height: 19),
          TextButton(
            onPressed: onSignOutPressed,
            child: Text('Sign out', style: TextStyle(color: ThemeColor.red)),
          ),
        ],
      ),
    );
  }
}

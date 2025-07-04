import 'package:e_commerce/core/widgets/tile.dart';
import 'package:flutter/material.dart';

class CartTile extends StatelessWidget {
  final String subtitle;
  final bool isAddress;

  final String location;

  const CartTile({
    super.key,
    required this.subtitle,
    required this.isAddress,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Tile(
      location: location,
      name: isAddress ? 'Shipping Address' : "Payment Method",
      showTrailingWidget: true,
      subtitle: subtitle,
    );
  }
}

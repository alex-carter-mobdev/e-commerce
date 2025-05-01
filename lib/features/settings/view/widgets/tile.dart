import 'package:e_commerce/core/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class Tile extends StatelessWidget {
  const Tile({
    super.key,
    this.leading,
    required this.location,
    required this.name,
  });

  final Widget? leading;
  final String? location;
  final String name;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: Text(name, style: TextStyle(fontSize: 16)),
      trailing: SvgPicture.asset('assets/icons/arrow_right.svg'),
      tileColor: ThemeColor.secondary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      contentPadding: EdgeInsets.only(left: 16, right: 12),
      onTap: () {
        location != null ? context.push(location!) : null;
      },
    );
  }
}

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
    this.showTrailingWidget,
    this.padding,
    this.subtitle,
    this.isBold,
    this.onPressed,
  });

  final Widget? leading;
  final String? location;
  final String name;
  final bool? showTrailingWidget;
  final Map<String, double>? padding;
  final void Function()? onPressed;

  final String? subtitle;

  final bool? isBold;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      subtitle:
          subtitle != null
              ? Text(
                subtitle!,
                style: TextStyle(fontSize: 16, color: ThemeColor.black_50),
              )
              : null,
      leading: leading,
      title: Text(
        name,
        style: TextStyle(
          fontSize: 16,
          fontWeight: isBold ?? false ? FontWeight.bold : null,
        ),
      ),
      trailing:
          showTrailingWidget ?? false
              ? SvgPicture.asset('assets/icons/arrow_right.svg')
              : null,
      tileColor: ThemeColor.secondary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      contentPadding:
          padding != null
              ? EdgeInsets.only(
                left: padding!['left'] ?? 16,
                right: padding!['right'] ?? 12,
                top: padding!['top'] ?? 0,
                bottom: padding!['bottom'] ?? 0,
              )
              : EdgeInsets.only(left: 16, right: 12),
      onTap: () {
        location != null ? context.push(location!) : null;
        onPressed?.call();
      },
    );
  }
}

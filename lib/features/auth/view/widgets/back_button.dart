// import 'package:e_commerce/core/theme/color.dart';
import 'package:e_commerce/core/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class Back extends StatelessWidget {
  const Back({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
        backgroundColor: ThemeColor.secondary,
      ),
      onPressed: () => context.pop(),

      child: SvgPicture.asset('assets/icons/arrow_left.svg'),
    );
  }
}

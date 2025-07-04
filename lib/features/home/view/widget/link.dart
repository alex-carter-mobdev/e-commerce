import 'package:e_commerce/core/theme/color.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Link extends StatelessWidget {
  const Link(this.name, {super.key, required this.onTap});
  final String name;

  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 16,
          color: ThemeColor.black_100,
          fontFamily: 'Gabarito',
        ),
        text: name,
        recognizer: TapGestureRecognizer()..onTap = onTap,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ColorCircle extends StatelessWidget {
  const ColorCircle({super.key, this.color, this.hex});

  final Color? color;
  final String? hex;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(99),
      child: Container(
        width: 16,
        height: 16,
        color: hex != null ? HexColor(hex!) : color,
      ),
    );
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

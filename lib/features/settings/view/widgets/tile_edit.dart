import 'package:e_commerce/core/theme/color.dart';
import 'package:flutter/material.dart';

class TileEdit extends StatelessWidget {
  const TileEdit({
    super.key,
    this.title,
    required this.subtitle,
    required this.onPressed,
  });

  final String? title;
  final String subtitle;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        color: ThemeColor.secondary,

        padding: EdgeInsets.only(
          left: 16,
          right: 20,
          bottom: title != null ? 36 : 18,
          top: 13,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title != null
                    ? Text(
                      title!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    )
                    : SizedBox(),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: title != null ? ThemeColor.black_50 : null,
                  ),
                ),
              ],
            ),
            TextButton(
              onPressed: onPressed,
              child: Text('Edit', style: TextStyle(color: ThemeColor.primary)),
            ),
          ],
        ),
      ),
    );
  }
}

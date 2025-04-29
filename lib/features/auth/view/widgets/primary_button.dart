import 'package:e_commerce/core/theme/color.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
    this.value, {
    super.key,
    required this.onPressed,
    this.isActive,
    this.isLoading,
    this.isFullsize,
  });

  final bool? isActive;
  final bool? isLoading;
  final bool? isFullsize;
  final String value;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isFullsize ?? true ? double.infinity : null,
      child: ElevatedButton(
        onPressed: isLoading ?? false ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              isActive ?? true ? ThemeColor.primary_100 : ThemeColor.secondary,
          padding: const EdgeInsets.all(20),
        ),
        child:
            isLoading ?? false
                ? SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(strokeWidth: 3),
                )
                : Text(
                  value,
                  style: TextStyle(
                    color:
                        isActive ?? true
                            ? ThemeColor.white_100
                            : ThemeColor.black_100,
                  ),
                ),
      ),
    );
  }
}

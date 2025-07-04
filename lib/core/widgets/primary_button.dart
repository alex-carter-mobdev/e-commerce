import 'package:e_commerce/core/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
    this.value, {
    super.key,
    required this.onPressed,
    this.isActive,
    this.isLoading,
    this.isFullsize,
    this.showTickIcon,
    this.isTrailingText,
    this.trailingText,
    this.padding,
  });

  final bool? isActive;
  final bool? showTickIcon;
  final bool? isLoading;
  final bool? isFullsize;
  final bool? isTrailingText;
  final String value;
  final void Function() onPressed;

  final String? trailingText;

  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isFullsize ?? true ? double.infinity : null,
      child: ElevatedButton(
        onPressed: isLoading ?? false ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              isActive ?? true ? ThemeColor.primary : ThemeColor.secondary,
          padding: padding ?? const EdgeInsets.all(20),
        ),
        child:
            isLoading ?? false
                ? SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(strokeWidth: 3),
                )
                : Row(
                  mainAxisAlignment:
                      showTickIcon != null || isTrailingText != null
                          ? MainAxisAlignment.spaceBetween
                          : MainAxisAlignment.center,
                  children: [
                    Text(
                      value,
                      style: TextStyle(
                        fontSize: 16,
                        color:
                            isActive ?? true
                                ? ThemeColor.white_100
                                : ThemeColor.black_100,
                      ),
                    ),
                    showTickIcon ?? false
                        ? SvgPicture.asset('assets/icons/tick.svg')
                        : SizedBox(),
                    isTrailingText ?? false
                        ? Text(
                          trailingText!,
                          style: TextStyle(
                            fontSize: 16,
                            color: ThemeColor.white_100,
                            fontWeight: FontWeight.w200,
                          ),
                        )
                        : SizedBox(),
                  ],
                ),
      ),
    );
  }
}

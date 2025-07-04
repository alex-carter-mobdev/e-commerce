import 'package:e_commerce/core/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TileEdit extends StatelessWidget {
  const TileEdit({
    super.key,
    this.title,
    required this.subtitle,
    this.onEditPressed,
    this.onDeletePressed,
    this.onTap,
  });

  final String? title;
  final String subtitle;
  final void Function()? onEditPressed;
  final void Function()? onTap;
  final void Function()? onDeletePressed;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),

      endActionPane:
          title == null
              ? ActionPane(
                motion: ScrollMotion(),

                children: [
                  SlidableAction(
                    onPressed: (context) => onEditPressed?.call(),
                    backgroundColor: Color(0xFF0392CF),
                    foregroundColor: Colors.white,
                    icon: Icons.edit,
                    // label: 'Edit',
                  ),
                  SlidableAction(
                    onPressed: (context) => onDeletePressed?.call(),
                    backgroundColor: Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    // label: 'Delete',
                  ),
                ],
              )
              : null,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: onTap,
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
                title != null
                    ? TextButton(
                      onPressed: onEditPressed,
                      child: Text(
                        'Edit',
                        style: TextStyle(color: ThemeColor.primary),
                      ),
                    )
                    : SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

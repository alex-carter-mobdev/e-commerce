import 'package:flutter/material.dart';

class ImageAsset extends StatelessWidget {
  final String url;
  final double? height;
  final double? width;

  const ImageAsset(this.url, {super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      height: height,
      width: width,
      fit: BoxFit.cover,
      loadingBuilder:
          (context, child, loadingProgress) =>
              loadingProgress == null
                  ? child
                  : CircularProgressIndicator(
                    constraints:
                        width != null
                            ? BoxConstraints(
                              minHeight: height!,
                              minWidth: width!,
                              maxHeight: height!,
                              maxWidth: width!,
                            )
                            : null,
                    value:
                        loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                  ),
    );
  }
}

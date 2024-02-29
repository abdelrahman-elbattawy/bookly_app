import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({
    super.key,
    required this.imageUrl,
    required this.borderRadius,
  });

  final String imageUrl;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: AspectRatio(
        aspectRatio: .66,
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: imageUrl,
        ),
      ),
    );
  }
}

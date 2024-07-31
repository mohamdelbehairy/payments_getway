import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'custom_circle_indicator.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({super.key, required this.imageUrl, this.imageHight});

  final String imageUrl;
  final double? imageHight;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        height: imageHight ?? 100,
        imageUrl: imageUrl,
        placeholder: (context, url) => const CustomCircleIndicator());
  }
}

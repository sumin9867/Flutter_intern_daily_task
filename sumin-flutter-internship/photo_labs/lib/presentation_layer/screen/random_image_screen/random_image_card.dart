import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:photo_labs/domain_layer/entity/photo_random_entity.dart';
import 'package:photo_labs/presentation_layer/screen/random_image_screen/random_image_detail.dart';

import 'package:photo_labs/presentation_layer/theme/screen_size.dart';

class RandomIamgeCard extends StatelessWidget {
  final PhotoRandomEntity photos;

  const RandomIamgeCard({
    Key? key,
    required this.photos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: photos.urls.full,
          height: ScreenSize.getScreenHeight(context) * 1,
          width: ScreenSize.getScreenWidth(context) * 1,
          fit: BoxFit.cover,
          placeholder: (context, url) {
            return Image(image: BlurHashImage(photos.blurHash));
          },
        ),
        Positioned(
            bottom: ScreenSize.getScreenHeight(context) * .07,
            child: RandomImageDetailCard(
              photos: photos,
            ))
      ],
    );
  }
}

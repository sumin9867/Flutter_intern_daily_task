import 'package:flutter/material.dart';

import 'package:photo_labs/domain_layer/entity/photo_random_entity.dart';

import 'package:photo_labs/presentation_layer/screen/random_image_screen/random_image_card.dart';

class RandomImagePageView extends StatelessWidget {
  final List<PhotoRandomEntity> photo;

  const RandomImagePageView({
    Key? key,
    required this.photo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();

    return PageView.builder(
      controller: pageController,
      itemCount: photo.length,
      itemBuilder: (context, index) {
        final photos = photo[index];
        return RandomIamgeCard(
          photos: photos,
        );
      },
    );
  }
}

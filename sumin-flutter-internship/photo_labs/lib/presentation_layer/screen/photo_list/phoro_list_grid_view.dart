import 'package:flutter/material.dart';
import 'package:photo_labs/domain_layer/entity/photo_list_entiry.dart';
import 'package:photo_labs/presentation_layer/screen/photo_list/photo_list_card.dart';
import 'package:photo_labs/presentation_layer/theme/screen_size.dart';

class PhotoListGridView extends StatelessWidget {
  final List<PhotoListEntity> photos;

  const PhotoListGridView({
    super.key,
    required this.photos,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenSize.getScreenWidth(context) * .02,
        ),
        child: GridView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: photos.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 0.6),
          itemBuilder: (context, index) {
            final photo = photos[index];

            return PhotoListCard(
              photoListEntity: photo,
              photoid: photo.id,
            );
          },
        ),
      ),
    );
  }
}

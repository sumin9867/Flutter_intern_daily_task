import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:photo_labs/domain_layer/entity/photo_topic_list_entity.dart';
import 'package:photo_labs/presentation_layer/theme/screen_size.dart';
import 'package:photo_labs/presentation_layer/theme/theme_text.dart';

class TopicPhotoListGridView extends StatelessWidget {
  final List<TopicListViewEntity> photos;

  const TopicPhotoListGridView({
    Key? key,
    required this.photos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: ScreenSize.getScreenHeight(context) * .03),
      child: MasonryGridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        itemCount: photos.length,
        itemBuilder: (BuildContext context, int index) {
          final photo = photos[index];
          return Stack(
            children: [
              GestureDetector(
                // not now,i will do later
                child: Card(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: photo.urls?.regular ?? '',
                      fit: BoxFit.fill,
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    photo.decription ?? '',
                    maxLines: 2,
                    style: PhotoListSlugDesign.style,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_labs/domain_layer/entity/photo_list_entiry.dart';
import 'package:photo_labs/presentation_layer/screen/photo_detail/movie_detail_argument.dart';
import 'package:photo_labs/presentation_layer/screen/photo_detail/photo_detail_widgets.dart';
import 'package:photo_labs/presentation_layer/theme/screen_size.dart';

class SearchCard extends StatelessWidget {
  final PhotoListEntity photoListEntity;
  const SearchCard({Key? key, required this.photoListEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          //   return PhotoDetailScreen(
          //     photoDetailArguments:
          //         PhotoDetailArguments(photoId: photoListEntity.id),
          //   );
          // }));

          context.pushNamed('photodetail',
              pathParameters: {'id': photoListEntity.id});
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ScreenSize.getScreenWidth(context) * .06,
              vertical: ScreenSize.getScreenHeight(context) * .017),
          child: SizedBox(
            width: ScreenSize.getScreenWidth(context) * 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    imageUrl: photoListEntity.urls.small!,
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    width: ScreenSize.getScreenWidth(context) * .3,
                  ),
                ),
                Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenSize.getScreenWidth(context) * .02),
                    width: ScreenSize.getScreenWidth(context) * .5,
                    child: Text(
                      formatSlug(
                        photoListEntity.slug,
                      ),
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ))
              ],
            ),
          ),
        ));
  }

  String formatSlug(String slug) {
    List<String> words = slug.split('-');
    List<String> capitalizedWords = words.map((word) {
      if (word.isNotEmpty) {
        return word[0].toUpperCase() + word.substring(1).toLowerCase();
      } else {
        return '';
      }
    }).toList();
    return capitalizedWords.join(' ');
  }
}

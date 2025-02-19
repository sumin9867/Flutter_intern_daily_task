import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_labs/domain_layer/entity/photo_list_entiry.dart';
import 'package:photo_labs/presentation_layer/theme/theme_text.dart';
import 'package:octo_image/octo_image.dart';

class PhotoListCard extends StatelessWidget {
  final PhotoListEntity photoListEntity;
  final String photoid;
  final double cardHeight;

  const PhotoListCard({
    Key? key,
    required this.photoListEntity,
    this.cardHeight = 400,
    required this.photoid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed('photodetail', pathParameters: {'id': photoid});
      },
      child: Container(
        height: cardHeight,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: OctoImage(
                image: NetworkImage(photoListEntity.urls.full!),
                placeholderBuilder: blurHashPlaceholderBuilder(
                    photoListEntity.blurHash ?? "",
                    fit: BoxFit.cover),
                errorBuilder: OctoError.icon(color: Colors.red),
                fit: BoxFit.cover,
                height: double.infinity,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  formatSlug(photoListEntity.slug),
                  maxLines: 2,
                  style: PhotoListSlugDesign.style,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to format the slug
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

  OctoPlaceholderBuilder blurHashPlaceholderBuilder(String hash,
      {BoxFit? fit}) {
    return (context) => SizedBox.expand(
          child: Image(
            image: BlurHashImage(hash),
            fit: fit ?? BoxFit.cover,
          ),
        );
  }
}

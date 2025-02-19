import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:octo_image/octo_image.dart';

import 'package:photo_labs/domain_layer/entity/photo_detail_entity.dart';
import 'package:photo_labs/presentation_layer/theme/screen_size.dart';
import 'package:photo_labs/presentation_layer/theme/theme_text.dart';

class BigPoster extends StatelessWidget {
  final PhotoDetailEntity photos;
  final String id;

  const BigPoster({Key? key, required this.photos, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: ScreenSize.getScreenHeight(context) * 1,
            foregroundDecoration: const BoxDecoration(),
            child: OctoImage(
                image: CachedNetworkImageProvider(photos.urls.full!),
                placeholderBuilder: blurHashPlaceholderBuilder(photos.blurHash,
                    fit: BoxFit.cover),
                errorBuilder: OctoError.icon(color: Colors.grey),
                fit: BoxFit.cover,
                fadeOutDuration: Duration(milliseconds: 2000),
                fadeInDuration: Duration(milliseconds: 200))),
        Positioned(
          top: ScreenSize.getScreenHeight(context) * .04,
          left: ScreenSize.getScreenWidth(context) * .02,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: const Color.fromARGB(255, 169, 169, 169).withOpacity(0.5),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              iconSize: ScreenSize.getScreenHeight(context) * .03,
            ),
          ),
        ),
        Positioned(
          top: ScreenSize.getScreenHeight(context) * .5,
          right: ScreenSize.getScreenWidth(context) * .01,
          child: Column(
            children: [
              IconButton(
                icon: Icon(
                  Icons.favorite_border,
                  size: ScreenSize.getScreenHeight(context) * .04,
                  color: Colors.white,
                ),
                onPressed: () {
                  // context.read<FavouriteCubit>().toggleFavorite(photos)
                },
              ),
              Text(
                photos.likes.toString(),
                style: DetailText.style,
              ),
              SizedBox(
                height: ScreenSize.getScreenHeight(context) * .02,
              ),
              Icon(
                Icons.download,
                size: ScreenSize.getScreenHeight(context) * .04,
                color: Colors.white,
              ),
              Text(
                photos.downloads.toString(),
                style: DetailText.style,
              )
            ],
          ),
        ),
        Positioned(
          bottom: ScreenSize.getScreenHeight(context) * 0.0,
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: ScreenSize.getScreenHeight(context) * 0.02,
              horizontal: ScreenSize.getScreenWidth(context) * 0.02,
            ),
            width: ScreenSize.getScreenWidth(context) * 1,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
              color: const Color.fromARGB(255, 46, 46, 46).withOpacity(0.5),
            ),
            child: Text(
              photos.description,
              style: HeadlineDetail.style,
              maxLines: 3,
            ),
          ),
        ),
      ],
    );
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

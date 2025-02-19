import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:movie_app/data/core/api_constant.dart';
import 'package:movie_app/domain/entities/movie_detail_entity.dart';
import 'package:movie_app/presentation/journey/movie_detail/movie_detail_appbar.dart';
import 'package:movie_app/presentation/theme/screen_size.dart';
import 'package:movie_app/presentation/theme/theme_text.dart';

class BigPoster extends StatelessWidget {
  final MovieDetailEntity movie;

  const BigPoster({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Stack(
        children: [
          Container(
            foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme.of(context).primaryColor.withOpacity(0.3),
                  Theme.of(context).primaryColor,
                ],
              ),
            ),
            child: CachedNetworkImage(
                imageUrl: '${ApiConstants.BASE_IMAGE_URL}${movie.posterPath}',
                width: ScreenSize.getScreenWidth(context) * 1),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: ListTile(
              title: Text(movie.title, style: HeadlineText.style),
              subtitle: Text(
                movie.releaseData,
                style: SmallDetails.style,
              ),
              trailing: Text("Rating: ${movie.voteAverage.toString()}",
                  style: SmallDetails.style),
            ),
          ),
          Positioned(
            top: ScreenSize.getScreenHeight(context) * .0,
            right: ScreenSize.getScreenWidth(context) * .04,
            left: ScreenSize.getScreenWidth(context) * .04,
            child: MovieDetailAppBar(movieDetailEntity: movie),
          ),
        ],
      ),
    );
  }
}

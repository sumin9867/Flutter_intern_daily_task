// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/data/core/api_constant.dart';
import 'package:movie_app/presentation/journey/movie_detail/movie_Detail_arguement/movie_detail_argument.dart';
import 'package:movie_app/presentation/journey/movie_detail/movie_detail_screen.dart';
import 'package:movie_app/presentation/theme/screen_size.dart';

class MovieTabCardWidgets extends StatelessWidget {
  final int movieId;
  final String title, posterPath;
  const MovieTabCardWidgets({
    Key? key,
    required this.movieId,
    required this.posterPath,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Expanded(
              child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MovieDetailScreen(
                    movieDetailArguments:
                        MovieDetailArguments(movieId: movieId)),
              ));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: '${ApiConstants.BASE_IMAGE_URL}$posterPath',
                fit: BoxFit.cover,
              ),
            ),
          )),
          Padding(
            padding: EdgeInsets.only(
                top: ScreenSize.getScreenHeight(context) * .02,
                bottom: ScreenSize.getScreenHeight(context) * .002),
            child: Text(
              title,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}

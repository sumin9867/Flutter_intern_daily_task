import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/data/core/api_constant.dart';
import 'package:movie_app/presentation/journey/movie_detail/movie_Detail_arguement/movie_detail_argument.dart';
import 'package:movie_app/presentation/journey/movie_detail/movie_detail_screen.dart';

class MovieCardWidgets extends StatelessWidget {
  final int movieId;
  final String posterPath;

  const MovieCardWidgets({
    Key? key,
    required this.movieId,
    required this.posterPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MovieDetailScreen(
                  movieDetailArguments:
                      MovieDetailArguments(movieId: movieId))));
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: CachedNetworkImage(
            imageUrl: '${ApiConstants.BASE_IMAGE_URL}$posterPath',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

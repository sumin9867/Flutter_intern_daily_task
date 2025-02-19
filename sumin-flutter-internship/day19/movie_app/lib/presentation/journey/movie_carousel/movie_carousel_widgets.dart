import 'package:flutter/material.dart';

import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/presentation/journey/movie_carousel/movie_page_view.dart';

class MovieCarouselWidget extends StatelessWidget {
  final List<MovieEntity>? movies;

  const MovieCarouselWidget({
    Key? key,
    required this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MoviePageView(
      movies: movies,
    );
  }
}

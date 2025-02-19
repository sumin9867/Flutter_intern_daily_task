import 'package:flutter/material.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';

import 'package:movie_app/presentation/journey/movie_tabbed.dart/movie_tab_card_widget.dart';
import 'package:movie_app/presentation/theme/screen_size.dart';

class MovieListViewBuilder extends StatelessWidget {
  final List<MovieEntity> movies;

  const MovieListViewBuilder({
    Key? key,
    required this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: ScreenSize.getScreenHeight(context) * .02,
          horizontal: ScreenSize.getScreenHeight(context) * .02),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) {
          return const SizedBox(width: 20);
        },
        itemCount: movies.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          final MovieEntity movie = movies[index];
          return GestureDetector(
            child: MovieTabCardWidgets(
              movieId: movie.id,
              posterPath: movie.posterPath,
              title: movie.title,
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/presentation/journey/favourite/favourite_card_widgets.dart';

class FavouriteMoviesGridView extends StatelessWidget {
  final List<MovieEntity> movies;
  const FavouriteMoviesGridView({Key? key, required this.movies})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
      ),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return FavouriteMoviesCardWidgets(movie: movies[index]);
      },
    );
  }
}

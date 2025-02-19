import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/entities/movie_detail_entity.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/presentation/cubit/favourite/cubit/favourite_movies_cubit.dart';
import 'package:movie_app/presentation/cubit/favourite/cubit/favourite_movies_state.dart';
import 'package:movie_app/presentation/theme/screen_size.dart';

class MovieDetailAppBar extends StatelessWidget {
  final MovieDetailEntity movieDetailEntity;

  const MovieDetailAppBar({Key? key, required this.movieDetailEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
          size: ScreenSize.getScreenHeight(context) * 0.03,
        ),
      ),
      actions: [
        BlocBuilder<FavoriteCubit, FavoriteState>(
          builder: (context, state) {
            return IconButton(
              onPressed: () {
                final movieEntity =
                    MovieEntity.fromMovieDetailEntity(movieDetailEntity);
                context.read<FavoriteCubit>().toggleFavoriteMovie(movieEntity);
              },
              icon: state is IsFavoriteMovie && state.isMovieFavorite
                  ? const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                  : const Icon(Icons.face),
            );
          },
        ),
      ],
    );
  }
}

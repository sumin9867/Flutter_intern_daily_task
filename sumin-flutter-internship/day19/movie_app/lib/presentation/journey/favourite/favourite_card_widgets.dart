import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/data/core/api_constant.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/presentation/cubit/favourite/cubit/favourite_movies_cubit.dart';
import 'package:movie_app/presentation/cubit/favourite/cubit/favourite_movies_state.dart';
import 'package:movie_app/presentation/journey/movie_detail/movie_Detail_arguement/movie_detail_argument.dart';
import 'package:movie_app/presentation/journey/movie_detail/movie_detail_screen.dart';
import 'package:movie_app/presentation/theme/screen_size.dart';

class FavouriteMoviesCardWidgets extends StatelessWidget {
  final MovieEntity movie;

  const FavouriteMoviesCardWidgets({Key? key, required this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieDetailScreen(
                    movieDetailArguments:
                        MovieDetailArguments(movieId: movie.id))));
      },
      child: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          if (state is FavoriteMoviesLoaded) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenSize.getScreenWidth(context) * .02,
                  vertical: ScreenSize.getScreenHeight(context) * .01),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Card(
                      child: CachedNetworkImage(
                        imageUrl:
                            "${ApiConstants.BASE_IMAGE_URL}${movie.posterPath}",
                        fit: BoxFit.cover,
                        width: ScreenSize.getScreenWidth(context) * .5,
                        height: ScreenSize.getScreenWidth(context) * .6,
                        placeholder: (context, url) => const Icon(Icons.movie),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                  Positioned(
                    right: ScreenSize.getScreenWidth(context) * .02,
                    top: ScreenSize.getScreenHeight(context) * .01,
                    child: IconButton(
                      onPressed: () {
                        context
                            .read<FavoriteCubit>()
                            .deleteFavoriteMovieById(movie.id);
                      },
                      icon: Icon(
                        Icons.delete,
                        size: ScreenSize.getScreenHeight(context) * .03,
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

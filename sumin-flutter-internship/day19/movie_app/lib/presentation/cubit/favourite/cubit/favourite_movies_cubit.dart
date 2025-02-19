import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/domain/entities/movie_params.dart';
import 'package:movie_app/domain/entities/no_params.dart';
import 'package:movie_app/domain/use_cases/check_if_favourite.dart';
import 'package:movie_app/domain/use_cases/delete_movies.local.dart';
import 'package:movie_app/domain/use_cases/get_favourite_movies.dart';
import 'package:movie_app/domain/use_cases/save_movie_local.dart';

import 'package:movie_app/presentation/cubit/favourite/cubit/favourite_movies_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final SaveDataLocal saveMovie;
  final GetFavoriteMovies getFavoriteMovies;
  final DeleteDataLocally deleteFavoriteMovie;
  final CheckIfFavoriteMovie checkIfFavoriteMovie;

  FavoriteCubit({
    required this.saveMovie,
    required this.getFavoriteMovies,
    required this.deleteFavoriteMovie,
    required this.checkIfFavoriteMovie,
  }) : super(FavoriteInitial());

  Future<void> toggleFavoriteMovie(MovieEntity movieEntity) async {
    final response = await checkIfFavoriteMovie(MovieParams(movieEntity.id));
    response.fold(
      (l) => emit(FavoriteMoviesError()),
      (isFavorite) async {
        if (isFavorite) {
          await deleteFavoriteMovieById(movieEntity.id);
        } else {
          await saveMovie(movieEntity);
        }

        emit(IsFavoriteMovie(!isFavorite));

        await loadFavoriteMovies();
      },
    );
  }

  Future<void> loadFavoriteMovies() async {
    final Either<AppError, List<MovieEntity>> response =
        await getFavoriteMovies(NoParams());

    response.fold(
      (l) => emit(FavoriteMoviesError()),
      (r) => emit(FavoriteMoviesLoaded(r)),
    );
  }

  Future<void> deleteFavoriteMovieById(int movieId) async {
    final currentState = state;
    if (currentState is FavoriteMoviesLoaded) {
      final updatedMovies =
          currentState.movies.where((movie) => movie.id != movieId).toList();

      emit(FavoriteMoviesLoaded(updatedMovies));
    }

    await deleteFavoriteMovie(MovieEntity(
        id: movieId,
        posterPath: '',
        backdropPath: '',
        title: '',
        releaseData: '',
        overview: '',
        voteAverage: 0));
  }

  Future<void> checkIfMovieIsFavorite(int movieId) async {
    final response = await checkIfFavoriteMovie(MovieParams(movieId));
    response.fold(
      (l) => emit(FavoriteMoviesError()),
      (r) => emit(IsFavoriteMovie(r)),
    );
  }
}

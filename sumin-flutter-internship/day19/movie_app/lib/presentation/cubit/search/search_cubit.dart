import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/domain/entities/movie_search_params.dart';
import 'package:movie_app/domain/use_cases/search_movies.dart';
import 'package:movie_app/presentation/cubit/search/search_state.dart';

class SearchMovieCubit extends Cubit<SearchMovieState> {
  final SearchMovies searchMovies;

  SearchMovieCubit({
    required this.searchMovies,
  }) : super(SearchMovieInitial());

  Future<void> searchMovieByTerm(String searchTerm) async {
    if (searchTerm.length > 2) {
      emit(SearchMovieLoading());
      final Either<AppError, List<MovieEntity>> response =
          await searchMovies(MovieSearchParams(searchTerm));
      response.fold(
        (l) => emit(SearchMovieError()),
        (r) => emit(SearchMovieLoaded(r)),
      );
    }
  }
}

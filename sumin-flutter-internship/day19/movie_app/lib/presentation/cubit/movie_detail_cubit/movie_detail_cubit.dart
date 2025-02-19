import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/movie_detail_entity.dart';
import 'package:movie_app/domain/entities/movie_params.dart';
import 'package:movie_app/domain/use_cases/get_movie_detail.dart';
import 'package:movie_app/presentation/cubit/movie_detail_cubit/movie_detail_state.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  final GetDetailMovie getMovieDetail;

  MovieDetailCubit({
    required this.getMovieDetail,
  }) : super(MovieDetailInitial());

  Future<void> fetchMovieDetail(int id) async {
    final Either<AppError, MovieDetailEntity> eitherResponse =
        await getMovieDetail(
      MovieParams(id),
    );

    eitherResponse.fold(
      (l) {
        emit(MovieDetailError());
      },
      (r) {
        emit(MovieDetailLoaded(movieDetailModel: r));
      },
    );
  }

//   Future<void> toggleFavorite(MovieDetailEntity movie) async {
//     SharedPreferencesHelper.saveMovieToFavorites(movie);
//   }

//   Future<void> removeFavourite(MovieDetailEntity movie) async {
//     try {
//       List<MovieDetailEntity> favMovies =
//           await SharedPreferencesHelper.getFavoriteMovies();

//       final index = favMovies.indexWhere((m) => m.id == movie.id);

//       if (index != -1) {
//         favMovies.removeAt(index);

//         await SharedPreferencesHelper.saveMovieToFavorites(movie);

//         emit(MovieFavouriteRemoved(movieid: movie.id));
//       } else {
//         emit(MovieDetailError());
//       }
//     } catch (e) {
//       emit(MovieDetailError());
//     }
//   }
// }}
}

import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/cast_entity.dart';
import 'package:movie_app/domain/entities/movie_detail_entity.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';

abstract class MovieRepositary {
  Future<Either<AppError, List<MovieEntity>>> getrending();
  Future<Either<AppError, List<MovieEntity>>> getPopular();
  Future<Either<AppError, List<MovieEntity>>> getPlayingNow();
  Future<Either<AppError, List<MovieEntity>>> getCommingSoon();
  Future<Either<AppError, MovieDetailEntity>> getMovieDetail(int id);
  Future<Either<AppError, List<CastEntity>>> getCastDetail(int id);
  Future<Either<AppError, List<MovieEntity>>> getSerchedMovies(
      String searchTerms);

  Future<Either<AppError, void>> saveMovies(MovieEntity movieEntity);
  Future<Either<AppError, List<MovieEntity>>> getFavouriteMovies();
  Future<Either<AppError, void>> deleteMovies(int id);
  Future<Either<AppError, bool>> checkifMoviesFavourite(int movieId);
}

import 'package:dartz/dartz.dart';
import 'package:movie_app/common/tables/movie_tables.dart';
import 'package:movie_app/data/data_source/movie_local_data_source.dart';
import 'package:movie_app/data/models/movie_cast_model.dart';
import 'package:movie_app/data/models/movie_detail_model.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/data/repositary/movie_remote_data.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/domain/repositary/movies_repo.dart';

class MovieRepoImplement extends MovieRepositary {
  final MovieRemoteDataSource movieRemoteDataSource;
  final MovieLocalDataSource movieLocalDataSource;

  MovieRepoImplement({
    required this.movieRemoteDataSource,
    required this.movieLocalDataSource,
  });

  @override
  Future<Either<AppError, List<MovieModel>>> getrending() async {
    try {
      final movie = await movieRemoteDataSource.getTrendings();
      return Right(movie);
    } on Exception {
      return const Left(AppError(message: "Something wenr wrong"));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getCommingSoon() async {
    try {
      final movie = await movieRemoteDataSource.getCommingSoon();
      return Right(movie);
    } on Exception {
      return const Left(AppError(message: "Something wenr wrong"));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPlayingNow() async {
    try {
      final movie = await movieRemoteDataSource.getPlayingNow();
      return Right(movie);
    } on Exception {
      return const Left(AppError(message: "Something wenr wrong"));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPopular() async {
    try {
      final movie = await movieRemoteDataSource.getpopular();
      return Right(movie);
    } on Exception {
      return const Left(AppError(message: "Something wenr wrong"));
    }
  }

  @override
  Future<Either<AppError, MovieDetailModel>> getMovieDetail(int id) async {
    try {
      final movie = await movieRemoteDataSource.getMovieDetail(id);

      return Right(movie);
    } on Exception {
      return const Left(AppError(message: "Something wenr wrong"));
    }
  }

  @override
  Future<Either<AppError, List<CastModel>>> getCastDetail(int id) async {
    try {
      final castCrew = await movieRemoteDataSource.getCastDetail(id);

      return Right(castCrew);
    } on Exception {
      return const Left(AppError(message: "Something wenr wrong"));
    }
  }

  @override
  Future<Either<AppError, List<MovieModel>>> getSerchedMovies(
      String searchTerms) async {
    try {
      final movie = await movieRemoteDataSource.getSearchdata(searchTerms);
      return Right(movie);
    } on Exception {
      return const Left(AppError(message: "Something wenr wrong"));
    }
  }

  @override
  Future<Either<AppError, bool>> checkifMoviesFavourite(int movieId) async {
    try {
      final response =
          await movieLocalDataSource.checkifMoviesFavourite(movieId);
      return Right(response);
    } catch (e) {
      return left(const AppError(message: "error chekcing data"));
    }
  }

  @override
  Future<Either<AppError, void>> deleteMovies(int id) async {
    try {
      final response = await movieLocalDataSource.deleteMovies(id);
      return Right(response);
    } catch (e) {
      return left(const AppError(message: "error delete data"));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getFavouriteMovies() async {
    try {
      final response = await movieLocalDataSource.getMovies();
      return Right(response);
    } catch (e) {
      return left(const AppError(message: "error getting data"));
    }
  }

  @override
  Future<Either<AppError, void>> saveMovies(MovieEntity movieEntity) async {
    try {
      final response = await movieLocalDataSource
          .saveMovies(MovieTable.fromMovieEntity(movieEntity));
      return Right(response);
    } catch (e) {
      return left(const AppError(message: "error saving data"));
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/movie_params.dart';
import 'package:movie_app/domain/repositary/movies_repo.dart';
import 'package:movie_app/domain/use_cases/use_case.dart';

class CheckIfFavoriteMovie extends UseCase<void, MovieParams> {
  MovieRepositary movieRepositary;
  CheckIfFavoriteMovie({
    required this.movieRepositary,
  });
  @override
  Future<Either<AppError, bool>> call(MovieParams params) async {
    return await movieRepositary.checkifMoviesFavourite(params.id);
  }
}

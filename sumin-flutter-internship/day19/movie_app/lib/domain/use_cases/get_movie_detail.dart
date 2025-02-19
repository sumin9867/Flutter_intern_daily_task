import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/movie_detail_entity.dart';
import 'package:movie_app/domain/entities/movie_params.dart';
import 'package:movie_app/domain/repositary/movies_repo.dart';
import 'package:movie_app/domain/use_cases/use_case.dart';

class GetDetailMovie extends UseCase<MovieDetailEntity, MovieParams> {
  final MovieRepositary movieRepositary;

  GetDetailMovie({required this.movieRepositary});

  @override
  Future<Either<AppError, MovieDetailEntity>> call(MovieParams params) async {
    return await movieRepositary.getMovieDetail(params.id);
  }
}

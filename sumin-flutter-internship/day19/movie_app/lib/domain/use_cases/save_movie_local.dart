// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/domain/repositary/movies_repo.dart';
import 'package:movie_app/domain/use_cases/use_case.dart';

class SaveDataLocal extends UseCase<void, MovieEntity> {
  MovieRepositary movieRepositary;
  SaveDataLocal({
    required this.movieRepositary,
  });
  @override
  Future<Either<AppError, void>> call(MovieEntity params) async {
    return await movieRepositary.saveMovies(params);
  }
}

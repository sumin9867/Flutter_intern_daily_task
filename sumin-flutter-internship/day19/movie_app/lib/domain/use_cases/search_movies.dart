import 'package:dartz/dartz.dart';

import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/domain/entities/movie_search_params.dart';
import 'package:movie_app/domain/repositary/movies_repo.dart';
import 'package:movie_app/domain/use_cases/use_case.dart';

class SearchMovies extends UseCase<List<MovieEntity>, MovieSearchParams> {
  final MovieRepositary repositary;

  SearchMovies({required this.repositary});

  @override
  Future<Either<AppError, List<MovieEntity>>> call(
      MovieSearchParams params) async {
    return await repositary.getSerchedMovies(params.searchTerms);
  }
}

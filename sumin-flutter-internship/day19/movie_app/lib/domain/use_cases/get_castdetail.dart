import 'package:dartz/dartz.dart';

import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/cast_entity.dart';
import 'package:movie_app/domain/entities/movie_params.dart';
import 'package:movie_app/domain/repositary/movies_repo.dart';
import 'package:movie_app/domain/use_cases/use_case.dart';

class GetCastDetail extends UseCase<List<CastEntity>, MovieParams> {
  final MovieRepositary repositary;

  GetCastDetail({required this.repositary});

  @override
  Future<Either<AppError, List<CastEntity>>> call(MovieParams params) async {
    return await repositary.getCastDetail(params.id);
  }
}

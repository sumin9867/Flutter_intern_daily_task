import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/domain/entities/no_params.dart';
import 'package:movie_app/domain/repositary/movies_repo.dart';
import 'package:movie_app/domain/use_cases/use_case.dart';

class GetTrending extends UseCase<List<MovieEntity>, NoParams> {
  final MovieRepositary repositary;

  GetTrending({required this.repositary});

  @override
  Future<Either<AppError, List<MovieEntity>>> call(NoParams params) async {
    return await repositary.getrending();
  }
}

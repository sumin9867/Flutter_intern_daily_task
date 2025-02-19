import 'package:dartz/dartz.dart';
import 'package:photo_labs/domain_layer/domain_repositary/photo_repository.dart';
import 'package:photo_labs/domain_layer/entity/app_error.dart';
import 'package:photo_labs/domain_layer/entity/no_params.dart';

import 'package:photo_labs/domain_layer/entity/photo_random_entity.dart';
import 'package:photo_labs/domain_layer/usecases/use_case.dart';

class GetRandomImages extends UseCase<List<PhotoRandomEntity>, NoParams> {
  final PhotoRepository photoRepository;

  GetRandomImages({required this.photoRepository});

  @override
  Future<Either<AppError, List<PhotoRandomEntity>>> call(
      NoParams params) async {
    return await photoRepository.getrandomImages();
  }
}

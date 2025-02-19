import 'package:dartz/dartz.dart';
import 'package:photo_labs/domain_layer/domain_repositary/photo_repository.dart';
import 'package:photo_labs/domain_layer/entity/app_error.dart';
import 'package:photo_labs/domain_layer/entity/movie_params.dart';
import 'package:photo_labs/domain_layer/entity/photo_detail_entity.dart';
import 'package:photo_labs/domain_layer/usecases/use_case.dart';

class GetDetailPhoto extends UseCase<PhotoDetailEntity, PhotoParams> {
  final PhotoRepository photoRepository;

  GetDetailPhoto({required this.photoRepository});

  @override
  Future<Either<AppError, PhotoDetailEntity>> call(PhotoParams params) async {
    try {
      final result = await photoRepository.getPhotodDetail(params.id);

      return result;
    } catch (e) {
      return const Left(AppError(message: 'error '));
    }
  }
}

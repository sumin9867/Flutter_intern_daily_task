import 'package:dartz/dartz.dart';
import 'package:photo_labs/domain_layer/domain_repositary/photo_repository.dart';
import 'package:photo_labs/domain_layer/entity/app_error.dart';
import 'package:photo_labs/domain_layer/entity/no_params.dart';
import 'package:photo_labs/domain_layer/entity/photo_list_entiry.dart';
import 'package:photo_labs/domain_layer/usecases/use_case.dart';

class GetPhotosList extends UseCase<List<PhotoListEntity>, NoParams> {
  final PhotoRepository photoRepository;

  GetPhotosList({required this.photoRepository});

  @override
  Future<Either<AppError, List<PhotoListEntity>>> call(NoParams params) async {
    return await photoRepository.getPhotosList();
  }
}

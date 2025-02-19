import 'package:dartz/dartz.dart';
import 'package:photo_labs/domain_layer/domain_repositary/photo_repository.dart';
import 'package:photo_labs/domain_layer/entity/app_error.dart';
import 'package:photo_labs/domain_layer/entity/photo_list_entiry.dart';
import 'package:photo_labs/domain_layer/entity/photo_search_params.dart';
import 'package:photo_labs/domain_layer/usecases/use_case.dart';

class SearchPhoto extends UseCase<List<PhotoListEntity>, MovieSearchParams> {
  final PhotoRepository photoRepository;

  SearchPhoto({required this.photoRepository});

  @override
  Future<Either<AppError, List<PhotoListEntity>>> call(
      MovieSearchParams params) async {
    return await photoRepository.getSearchData(params.query);
  }
}

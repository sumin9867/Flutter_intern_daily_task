import 'package:dartz/dartz.dart';
import 'package:photo_labs/domain_layer/domain_repositary/photo_repository.dart';
import 'package:photo_labs/domain_layer/entity/app_error.dart';
import 'package:photo_labs/domain_layer/entity/no_params.dart';
import 'package:photo_labs/domain_layer/entity/photo_get_topic_entity.dart';

import 'package:photo_labs/domain_layer/usecases/use_case.dart';

class GetTopicList extends UseCase<List<TopicListEntity>, NoParams> {
  final PhotoRepository photoRepository;

  GetTopicList({required this.photoRepository});

  @override
  Future<Either<AppError, List<TopicListEntity>>> call(NoParams params) async {
    return await photoRepository.getTopic();
  }
}

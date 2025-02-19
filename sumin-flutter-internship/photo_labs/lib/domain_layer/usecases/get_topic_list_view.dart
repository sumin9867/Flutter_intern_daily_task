import 'package:dartz/dartz.dart';
import 'package:photo_labs/domain_layer/domain_repositary/photo_repository.dart';
import 'package:photo_labs/domain_layer/entity/app_error.dart';
import 'package:photo_labs/domain_layer/entity/movie_params.dart';
import 'package:photo_labs/domain_layer/entity/photo_topic_list_entity.dart';
import 'package:photo_labs/domain_layer/usecases/use_case.dart';

class GetTopicListView extends UseCase<List<TopicListViewEntity>, PhotoParams> {
  final PhotoRepository photoRepository;

  GetTopicListView({required this.photoRepository});

  @override
  Future<Either<AppError, List<TopicListViewEntity>>> call(
      PhotoParams params) async {
    try {
      final result = await photoRepository.getTopicListView(params.id);

      return result;
    } catch (e) {
      return Left(AppError(message: 'Failed to get topic list view: $e'));
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:photo_labs/domain_layer/entity/app_error.dart';
import 'package:photo_labs/domain_layer/entity/photo_detail_entity.dart';
import 'package:photo_labs/domain_layer/entity/photo_get_topic_entity.dart';
import 'package:photo_labs/domain_layer/entity/photo_list_entiry.dart';
import 'package:photo_labs/domain_layer/entity/photo_random_entity.dart';
import 'package:photo_labs/domain_layer/entity/photo_topic_list_entity.dart';

abstract class PhotoRepository {
  Future<Either<AppError, List<PhotoListEntity>>> getPhotosList();
  Future<Either<AppError, List<TopicListEntity>>> getTopic();
  Future<Either<AppError, List<PhotoListEntity>>> getSearchData(String query);
  Future<Either<AppError, List<PhotoRandomEntity>>> getrandomImages();

  Future<Either<AppError, PhotoDetailEntity>> getPhotodDetail(String id);
  Future<Either<AppError, List<TopicListViewEntity>>> getTopicListView(
      String id);
}

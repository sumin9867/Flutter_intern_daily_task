import 'package:dartz/dartz.dart';

import 'package:photo_labs/data_layer/data_repository/photo_labs_remote_data_source.dart';
import 'package:photo_labs/data_layer/models/photo_detail.dart';
import 'package:photo_labs/data_layer/models/photo_get_topic.dart';
import 'package:photo_labs/data_layer/models/photo_list_model.dart';
import 'package:photo_labs/data_layer/models/photo_random_images.dart';
import 'package:photo_labs/data_layer/models/photo_topic_list_model.dart';
import 'package:photo_labs/domain_layer/domain_repositary/photo_repository.dart';
import 'package:photo_labs/domain_layer/entity/app_error.dart';

class PhotoRepositoryImpl extends PhotoRepository {
  PhotoLabsRemoteDataSource photoLabsRemoteDataSource;
  PhotoRepositoryImpl({
    required this.photoLabsRemoteDataSource,
  });
  @override
  Future<Either<AppError, List<PhotoModel>>> getPhotosList() async {
    try {
      final movie = await photoLabsRemoteDataSource.getPhotoList();
      return Right(movie);
    } on Exception {
      return const Left(AppError(message: "Something wenr wrong"));
    }
  }

  @override
  Future<Either<AppError, PhotoDetailModel>> getPhotodDetail(String id) async {
    try {
      final photos = await photoLabsRemoteDataSource.getPhotoDetail(id);

      return Right(photos);
    } catch (e) {
      return const Left(AppError(message: "Something went wrong"));
    }
  }

  @override
  Future<Either<AppError, List<PhotoRandom>>> getrandomImages() async {
    try {
      final photos = await photoLabsRemoteDataSource.getRandomImages();

      ('Data reached getrandomImages method');
      return Right(photos);
    } on Exception {
      return const Left(AppError(message: "Something went wrong"));
    }
  }

  @override
  Future<Either<AppError, List<PhotoModel>>> getSearchData(String query) async {
    try {
      final photo = await photoLabsRemoteDataSource.getsearchdata(query);
      return Right(photo);
    } on Exception {
      return const Left(AppError(message: "Something wenr wrong"));
    }
  }

  @override
  Future<Either<AppError, List<TopicListModel>>> getTopic() async {
    try {
      final photo = await photoLabsRemoteDataSource.getTopicList();
      return Right(photo);
    } catch (e) {
      // Add this line
      return left(const AppError(message: "Cant  topic list"));
    }
  }

  @override
  Future<Either<AppError, List<PhotoTopicListView>>> getTopicListView(
      String id) async {
    try {
      final photos = await photoLabsRemoteDataSource.getTopicListView(id);
      return Right(photos);
    } on Exception {
      return const Left(AppError(message: "Something wenr wrong"));
    }
  }
}

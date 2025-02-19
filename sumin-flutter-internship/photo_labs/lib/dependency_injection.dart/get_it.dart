import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:photo_labs/data_layer/core/api_client.dart';
import 'package:photo_labs/data_layer/data_repository/photo_labs_remote_data_source.dart';
import 'package:photo_labs/data_layer/data_repository/photo_repository_impl.dart';
import 'package:photo_labs/data_layer/data_source/photo_labs_remote_data_source_impl.dart';
import 'package:photo_labs/domain_layer/domain_repositary/photo_repository.dart';
import 'package:photo_labs/domain_layer/usecases/get_photo_list.dart';
import 'package:photo_labs/domain_layer/usecases/get_photos_detail.dart';
import 'package:photo_labs/domain_layer/usecases/get_random_images.dart';
import 'package:photo_labs/domain_layer/usecases/get_search_photo.dart';
import 'package:photo_labs/domain_layer/usecases/get_topic_list.dart';
import 'package:photo_labs/domain_layer/usecases/get_topic_list_view.dart';

final getItInstance = GetIt.I;

Future setupDependencies() async {
  getItInstance.registerLazySingleton<Client>(() => Client());
  getItInstance.registerLazySingleton<ApiClient>(
      () => ApiClient(getItInstance<Client>()));

  getItInstance.registerLazySingleton<PhotoLabsRemoteDataSource>(
      () => PhotoLabsRemoteDataSourceImp(apiClient: getItInstance()));
  getItInstance.registerLazySingleton<PhotoRepository>(
      () => PhotoRepositoryImpl(photoLabsRemoteDataSource: getItInstance()));
  getItInstance.registerLazySingleton<GetPhotosList>(
      () => GetPhotosList(photoRepository: getItInstance()));
  getItInstance.registerLazySingleton<GetDetailPhoto>(
      () => GetDetailPhoto(photoRepository: getItInstance()));
  getItInstance.registerLazySingleton<GetRandomImages>(
      () => GetRandomImages(photoRepository: getItInstance()));
  getItInstance.registerLazySingleton<SearchPhoto>(
      () => SearchPhoto(photoRepository: getItInstance()));
  getItInstance.registerLazySingleton<GetTopicList>(
      () => GetTopicList(photoRepository: getItInstance()));
  getItInstance.registerLazySingleton<GetTopicListView>(
      () => GetTopicListView(photoRepository: getItInstance()));
}

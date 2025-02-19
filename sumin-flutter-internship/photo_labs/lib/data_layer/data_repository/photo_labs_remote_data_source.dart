import 'package:photo_labs/data_layer/models/photo_detail.dart';
import 'package:photo_labs/data_layer/models/photo_get_topic.dart';
import 'package:photo_labs/data_layer/models/photo_list_model.dart';
import 'package:photo_labs/data_layer/models/photo_random_images.dart';
import 'package:photo_labs/data_layer/models/photo_topic_list_model.dart';

abstract class PhotoLabsRemoteDataSource {
  Future<List<PhotoModel>> getPhotoList();
  Future<List<TopicListModel>> getTopicList();
  Future<List<PhotoModel>> getsearchdata(String query);
  Future<PhotoDetailModel> getPhotoDetail(String id);
  Future<List<PhotoTopicListView>> getTopicListView(String id);
  Future<List<PhotoRandom>> getRandomImages();
}

import 'package:photo_labs/data_layer/core/api_client.dart';
import 'package:photo_labs/data_layer/core/api_constant.dart';
import 'package:photo_labs/data_layer/data_repository/photo_labs_remote_data_source.dart';
import 'package:photo_labs/data_layer/models/photo_detail.dart';
import 'package:photo_labs/data_layer/models/photo_get_topic.dart';
import 'package:photo_labs/data_layer/models/photo_list_model.dart';
import 'package:photo_labs/data_layer/models/photo_random_images.dart';
import 'package:photo_labs/data_layer/models/photo_topic_list_model.dart';

class PhotoLabsRemoteDataSourceImp extends PhotoLabsRemoteDataSource {
  final ApiClient apiClient;

  PhotoLabsRemoteDataSourceImp({required this.apiClient});

  @override
  Future<List<PhotoModel>> getPhotoList() async {
    try {
      final response = await apiClient.get(
        'photos',
        params: {'client_id': ApiConstants.API_KEY},
      );

      final List<dynamic> jsonList = response;
      final List<PhotoModel> photoList = jsonList.map((json) {
        final model = PhotoModel.fromJson(json);
        return model;
      }).toList();

      return photoList;
    } catch (e) {
      throw Exception('Failed to fetch photo list: $e');
    }
  }

  @override
  Future<PhotoDetailModel> getPhotoDetail(String id) async {
    try {
      final response = await apiClient.get(
        'photos/$id',
        params: {'client_id': ApiConstants.API_KEY},
      );

      final jsonList = response;
      final model = PhotoDetailModel.fromJson(jsonList);
      return model;
    } catch (e) {
      throw Exception('Failed to fetch detail list: $e');
    }
  }

  @override
  Future<List<PhotoRandom>> getRandomImages() async {
    try {
      final response = await apiClient.get(
        'photos/random',
        params: {'client_id': ApiConstants.API_KEY},
      );

      final dynamic jsonData = response;
      if (jsonData is List) {
        final List<PhotoRandom> photoList = jsonData.map((json) {
          return PhotoRandom.fromJson(json as Map<String, dynamic>);
        }).toList();
        return photoList;
      } else if (jsonData is Map) {
        final photo = PhotoRandom.fromJson(jsonData as Map<String, dynamic>);
        return [photo];
      } else {
        throw Exception('Unexpected response format');
      }
    } catch (e) {
      throw Exception('Failed to fetch photo list: $e');
    }
  }

  @override
  Future<List<PhotoModel>> getsearchdata(String query) async {
    try {
      final response = await apiClient.get(
        'search/photos',
        params: {'query': query, 'client_id': ApiConstants.API_KEY},
      );

      final List<dynamic> data = response['results'];
      return data.map((json) => PhotoModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load images: $e');
    }
  }

  @override
  Future<List<TopicListModel>> getTopicList() async {
    try {
      final response = await apiClient.get(
        'topics',
        params: {'client_id': ApiConstants.API_KEY},
      );

      final List<dynamic> jsonList = response;
      final List<TopicListModel> topicList = jsonList.map((json) {
        final model = TopicListModel.fromJson(json);
        return model;
      }).toList();

      return topicList;
    } catch (e) {
      throw Exception('Failed to fetch topic list: $e');
    }
  }

  @override
  Future<List<PhotoTopicListView>> getTopicListView(String id) async {
    try {
      final response = await apiClient.get(
        'topics/$id/photos',
        params: {'client_id': ApiConstants.API_KEY},
      );

      final List<dynamic> jsonList = response;
      final List<PhotoTopicListView> photoList = [];

      for (var json in jsonList) {
        final model = PhotoTopicListView.fromJson(json);
        photoList.add(model);
      }

      return photoList;
    } catch (e) {
      throw Exception('Failed to fetch photo list: $e');
    }
  }
}

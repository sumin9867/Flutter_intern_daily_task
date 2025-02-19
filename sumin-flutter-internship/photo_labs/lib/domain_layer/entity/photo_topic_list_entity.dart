import 'package:equatable/equatable.dart';
import 'package:photo_labs/data_layer/models/photo_topic_list_model.dart';

class TopicListViewEntity extends Equatable {
  final String id;

  final int width;
  final int height;
  final String? decription;

  final String blurHash;
  final UnsplashUrls? urls;

  const TopicListViewEntity(
      {required this.id,
      required this.width,
      required this.height,
      this.decription,
      required this.blurHash,
      this.urls});

  @override
  List<Object?> get props => [id, width, height, blurHash, urls];
}

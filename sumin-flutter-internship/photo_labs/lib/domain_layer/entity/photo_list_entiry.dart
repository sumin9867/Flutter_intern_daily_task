import 'package:equatable/equatable.dart';
import 'package:photo_labs/data_layer/models/photo_list_model.dart';

class PhotoListEntity extends Equatable {
  final String id;
  final String slug;

  final String? blurHash;
  // final dynamic description;

  final Urls urls;

  final int likes;

  const PhotoListEntity({
    required this.id,
    required this.slug,
    this.blurHash,
    // required this.description,
    required this.urls,
    required this.likes,
  });

  @override
  List<Object?> get props => [
        id,
        slug,
        blurHash,
      ];
}

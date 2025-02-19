import 'package:equatable/equatable.dart';
import 'package:photo_labs/data_layer/models/photo_detail.dart';

class PhotoDetailEntity extends Equatable {
  final String id;
  final String blurHash;
  final int downloads;
  final int likes;
  final String description;
  final Urls urls;

  const PhotoDetailEntity({
    required this.id,
    required this.blurHash,
    required this.downloads,
    required this.likes,
    required this.description,
    required this.urls,
  });

  factory PhotoDetailEntity.fromJson(Map<String, dynamic> json) {
    return PhotoDetailEntity(
      id: json['id'] ?? '',
      blurHash: json['blur_hash'] ?? '',
      downloads: json['downloads'] ?? 0,
      likes: json['likes'] ?? 0,
      description: json['description'] ?? '',
      urls: Urls.fromJson(json['urls'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'blur_hash': blurHash,
      'downloads': downloads,
      'likes': likes,
      'description': description,
      'urls': urls,
    };
  }

  @override
  List<Object?> get props =>
      [id, blurHash, description, downloads, likes, urls];
}

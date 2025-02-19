// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:photo_labs/data_layer/models/photo_random_images.dart';

class PhotoRandomEntity extends Equatable {
  final String id;

  final String blurHash;

  final Exif? exif;
  final String? description;

  final Urls urls;

  final User user;
  final int? downloads;
  final Location? location;
  final int? likes;

  const PhotoRandomEntity({
    required this.id,
    required this.blurHash,
    this.exif,
    this.description,
    required this.urls,
    this.location,
    this.likes,
    required this.user,
    this.downloads,
  });

  @override
  List<Object?> get props => [id, blurHash, exif, urls, user];
}

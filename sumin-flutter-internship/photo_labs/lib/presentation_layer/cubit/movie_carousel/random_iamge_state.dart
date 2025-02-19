import 'package:photo_labs/domain_layer/entity/photo_random_entity.dart';

abstract class PhotoCarouselState {
  final int index;

  const PhotoCarouselState(this.index);
}

class PhotoCarouselInitial extends PhotoCarouselState {
  const PhotoCarouselInitial() : super(0);
  List<Object?> get props => [];
}

class PhotoCarouselLoaded extends PhotoCarouselState {
  final List<PhotoRandomEntity> photos;
  final int defaultIndex;
  PhotoCarouselLoaded(
    super.key, {
    required this.photos,
    this.defaultIndex = 0,
  }) : assert(defaultIndex >= 0, 'Defailt index cannot be less than 0');

  List<Object?> get props => [photos, index];
}

class PhotoCarouselError extends PhotoCarouselState {
  const PhotoCarouselError() : super(0);

  List<Object?> get props => [];
}

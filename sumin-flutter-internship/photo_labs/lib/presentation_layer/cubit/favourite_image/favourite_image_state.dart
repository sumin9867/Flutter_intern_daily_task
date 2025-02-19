import 'package:equatable/equatable.dart';
import 'package:photo_labs/domain_layer/entity/photo_detail_entity.dart';

abstract class FavouriteState extends Equatable {
  const FavouriteState();

  @override
  List<Object> get props => [];
}

class FavouriteLoading extends FavouriteState {}

class FavouriteLoaded extends FavouriteState {
  final List<PhotoDetailEntity> favourites;

  const FavouriteLoaded({required this.favourites});

  @override
  List<Object> get props => [favourites];
}

class FavouriteError extends FavouriteState {
  final String message;

  const FavouriteError(this.message);

  @override
  List<Object> get props => [message];
}

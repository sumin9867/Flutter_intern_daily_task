import 'package:equatable/equatable.dart';
import 'package:photo_labs/domain_layer/entity/photo_list_entiry.dart';

abstract class PhotoListState extends Equatable {
  const PhotoListState();

  @override
  List<Object> get props => [];
}

class PhotoListInitial extends PhotoListState {}

class PhotoListLoaded extends PhotoListState {
  final List<PhotoListEntity> photos;

  const PhotoListLoaded({required this.photos});
}

class PhotoListError extends PhotoListState {}

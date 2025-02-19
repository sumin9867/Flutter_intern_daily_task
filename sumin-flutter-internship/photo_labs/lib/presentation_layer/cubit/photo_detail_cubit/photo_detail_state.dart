// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:photo_labs/domain_layer/entity/photo_detail_entity.dart';

abstract class PhotoDetailState extends Equatable {
  const PhotoDetailState();

  @override
  List<Object> get props => [];
}

class PhotoDetailInitial extends PhotoDetailState {}

class PhotoDetailLoaded extends PhotoDetailState {
  final PhotoDetailEntity photoDetailEntity;

  const PhotoDetailLoaded({
    required this.photoDetailEntity,
  });
}

class PhotoDetailError extends PhotoDetailState {}

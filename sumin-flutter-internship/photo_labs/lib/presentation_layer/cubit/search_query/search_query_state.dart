import 'package:equatable/equatable.dart';
import 'package:photo_labs/domain_layer/entity/photo_list_entiry.dart';

abstract class SearchQueryState extends Equatable {
  const SearchQueryState();

  @override
  List<Object> get props => [];
}

class SearchQueryInitial extends SearchQueryState {}

class SearchQueryLoaded extends SearchQueryState {
  final List<PhotoListEntity> photos;

  const SearchQueryLoaded({required this.photos});
}

class SearchQueryError extends SearchQueryState {}

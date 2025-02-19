import 'package:equatable/equatable.dart';
import 'package:photo_labs/domain_layer/entity/photo_get_topic_entity.dart';

sealed class TopicListState extends Equatable {
  const TopicListState();

  @override
  List<Object> get props => [];
}

class TopicListInitial extends TopicListState {}

class TopicListLoaded extends TopicListState {
  final List<TopicListEntity> topic;

  const TopicListLoaded({required this.topic});
}

class TopicListError extends TopicListState {}

import 'package:equatable/equatable.dart';
import 'package:photo_labs/domain_layer/entity/photo_topic_list_entity.dart';

abstract class TopicListViewState extends Equatable {
  const TopicListViewState();

  @override
  List<Object?> get props => [];
}

class TopicListViewInitial extends TopicListViewState {}

class TopicListViewLoading extends TopicListViewState {}

class TopicListViewLoaded extends TopicListViewState {
  final List<TopicListViewEntity> topicListView;

  const TopicListViewLoaded(this.topicListView);

  @override
  List<Object?> get props => [topicListView];
}

class TopicListViewError extends TopicListViewState {
  final String message;

  const TopicListViewError(this.message);

  @override
  List<Object?> get props => [message];
}

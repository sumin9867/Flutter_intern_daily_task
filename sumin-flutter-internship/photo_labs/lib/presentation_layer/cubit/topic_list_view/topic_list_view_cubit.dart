import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_labs/domain_layer/entity/movie_params.dart';

import 'package:photo_labs/domain_layer/usecases/get_topic_list_view.dart';
import 'package:photo_labs/presentation_layer/cubit/topic_list_view/topic_list_view_state.dart';

class TopicListViewCubit extends Cubit<TopicListViewState> {
  final GetTopicListView getTopicListView;

  TopicListViewCubit(this.getTopicListView) : super(TopicListViewInitial());

  Future<void> getTopicListViewData(String id) async {
    emit(TopicListViewLoading());
    final params = PhotoParams(id);
    final eitherResponse = await getTopicListView(params);

    eitherResponse.fold(
      (error) => emit(TopicListViewError(error.message)),
      (topicListView) => emit(TopicListViewLoaded(topicListView)),
    );
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_labs/domain_layer/entity/no_params.dart';

import 'package:photo_labs/domain_layer/usecases/get_topic_list.dart';

import 'package:photo_labs/presentation_layer/cubit/topic_list/topic_list_state.dart';

class TopicListCubit extends Cubit<TopicListState> {
  GetTopicList getTopicList;

  TopicListCubit(
    this.getTopicList,
  ) : super(TopicListInitial());

  Future<void> getTopiclist() async {
    emit(TopicListInitial());
    try {
      final photoEither = await getTopicList(NoParams());
      photoEither.fold(
        (failure) {
          emit(TopicListError());
        },
        (topic) {
          emit(TopicListLoaded(topic: topic));
        },
      );
    } catch (e) {
      emit(TopicListError());
    }
  }
}

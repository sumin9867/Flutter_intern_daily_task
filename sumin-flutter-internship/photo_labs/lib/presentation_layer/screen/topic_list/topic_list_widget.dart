import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_labs/presentation_layer/cubit/topic_list/topic_list_cubit.dart';
import 'package:photo_labs/presentation_layer/cubit/topic_list/topic_list_state.dart';
import 'package:photo_labs/presentation_layer/screen/topic_list/topic_list_view.dart';

class TopicListWidgets extends StatelessWidget {
  const TopicListWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<TopicListCubit>(context).getTopiclist();

    return BlocBuilder<TopicListCubit, TopicListState>(
      builder: (context, state) {
        if (state is TopicListInitial) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TopicListLoaded) {
          return TopicListView(topic: state.topic);
        } else if (state is TopicListError) {
          return const Text("Error Loading the Topics");
        }
        return Container();
      },
    );
  }
}

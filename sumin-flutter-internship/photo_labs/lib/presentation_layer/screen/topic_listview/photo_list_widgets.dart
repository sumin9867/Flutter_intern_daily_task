import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_labs/presentation_layer/cubit/topic_list_view/topic_list_view_cubit.dart';
import 'package:photo_labs/presentation_layer/cubit/topic_list_view/topic_list_view_state.dart';
import 'package:photo_labs/presentation_layer/screen/topic_listview/phoro_topic_list_grid_view.dart';
import 'package:photo_labs/presentation_layer/theme/screen_size.dart';
import 'package:photo_labs/presentation_layer/widgets/appbar_widgets.dart';

class TopicListViewScreen extends StatelessWidget {
  final String id;
  final String title;
  bool isDataFetched = false;

  TopicListViewScreen({
    Key? key,
    required this.id,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          right: ScreenSize.getScreenWidth(context) * .02,
          left: ScreenSize.getScreenWidth(context) * .02,
          top: ScreenSize.getScreenWidth(context) * .14,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(
              title: 'Photo Gallery',
              iconData: Icons.arrow_back_ios,
              iconData2: Icons.notifications,
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<TopicListViewCubit, TopicListViewState>(
                builder: (context, state) {
                  if (!isDataFetched) {
                    final cubit = context.read<TopicListViewCubit>();
                    cubit.getTopicListViewData(id);
                    isDataFetched = true;
                  }

                  if (state is TopicListViewLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is TopicListViewLoaded) {
                    final topicList = state.topicListView;

                    return TopicPhotoListGridView(photos: topicList);
                  } else if (state is TopicListViewError) {
                    return Center(child: Text(state.message));
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

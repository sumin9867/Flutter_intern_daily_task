import 'package:flutter/material.dart';

import 'package:photo_labs/domain_layer/entity/photo_get_topic_entity.dart';
import 'package:photo_labs/presentation_layer/screen/topic_list/topic_list_card.dart';
import 'package:photo_labs/presentation_layer/theme/screen_size.dart';

class TopicListView extends StatelessWidget {
  final List<TopicListEntity> topic;
  // Callback function for onTap event
  const TopicListView({
    Key? key,
    required this.topic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenSize.getScreenHeight(context) * .06,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: topic.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => {}, // Pass the index to the onTap callback
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: TopicListCard(
                topicListEntity: topic[index],
                listid: topic[index].id,
              ),
            ),
          );
        },
      ),
    );
  }
}

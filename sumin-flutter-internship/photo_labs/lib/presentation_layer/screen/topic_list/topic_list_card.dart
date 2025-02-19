import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_labs/domain_layer/entity/photo_get_topic_entity.dart';

class TopicListCard extends StatelessWidget {
  final TopicListEntity topicListEntity;
  final String listid;

  const TopicListCard(
      {super.key, required this.topicListEntity, required this.listid});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.goNamed(
          'topicListViewScreen',
          extra: {'id': listid, 'title': topicListEntity.title},
        );
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 213, 210, 210)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                '${topicListEntity.slug[0].toUpperCase()}${topicListEntity.slug.substring(1)}',
                style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.w700),
              ),
            )
          ],
        ),
      ),
    );
  }
}

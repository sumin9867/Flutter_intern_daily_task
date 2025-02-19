import 'package:flutter/material.dart';
import 'package:photo_labs/presentation_layer/screen/photo_list/photo_list_widgets.dart';
import 'package:photo_labs/presentation_layer/screen/topic_list/topic_list_widget.dart';
import 'package:photo_labs/presentation_layer/theme/screen_size.dart';
import 'package:photo_labs/presentation_layer/widgets/appbar_widgets.dart';
import 'package:photo_labs/presentation_layer/screen/search_bar/search_widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: EdgeInsets.only(
              right: ScreenSize.getScreenWidth(context) * .02,
              left: ScreenSize.getScreenWidth(context) * .02,
              top: ScreenSize.getScreenWidth(context) * .14,
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(
                  title: 'Photo Gallary',
                  iconData: Icons.menu,
                  iconData2: Icons.notifications,
                ),
                // SizedBox(height: 16),
                TopicListWidgets(),
                SizedBox(height: 8),
                SearchContainer(),
                SizedBox(height: 8),
                PhotoListWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:photo_labs/domain_layer/entity/photo_random_entity.dart';
import 'package:photo_labs/presentation_layer/theme/screen_size.dart';
import 'package:photo_labs/presentation_layer/widgets/random_counter.dart';

class RandomImageDetailCard extends StatelessWidget {
  final PhotoRandomEntity photos;
  const RandomImageDetailCard({super.key, required this.photos});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenSize.getScreenWidth(context) * 1,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 35, 35, 35).withOpacity(0.8),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Text(photos.description ?? ""),
        Text(
          "Photo Of The Moment",
          style: TextStyle(
              fontSize: ScreenSize.getScreenHeight(context) * .03,
              color: Colors.white,
              fontWeight: FontWeight.w700),
        ),
        Gap(ScreenSize.getScreenHeight(context) * .01),
        Text(
          "Capture with ${photos.exif?.model ?? " Canon"}",
          style: TextStyle(
              fontSize: ScreenSize.getScreenHeight(context) * .02,
              color: Colors.white,
              fontWeight: FontWeight.w700),
        ),
        Gap(ScreenSize.getScreenHeight(context) * .02),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ScreenSize.getScreenWidth(context) * .07),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomCounters(data: photos.likes.toString(), labelText: "Likes"),
              CustomCounters(
                  data: photos.downloads.toString(), labelText: "DownLoads"),
              CustomCounters(
                  data: photos.location?.city ?? "", labelText: "Loaction")
            ],
          ),
        ),
        Gap(ScreenSize.getScreenHeight(context) * .02),
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:photo_labs/presentation_layer/theme/screen_size.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final IconData iconData;
  final IconData iconData2;

  final VoidCallback? onPressed;

  const CustomAppBar(
      {Key? key,
      required this.title,
      required this.iconData,
      this.onPressed,
      required this.iconData2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: ScreenSize.getScreenWidth(context) * 0.06,
              color: const Color.fromARGB(255, 12, 12, 12),
            ),
          ),
          Text(
            title,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          Container(
            padding: const EdgeInsets.all(0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border:
                  Border.all(color: const Color.fromARGB(255, 172, 165, 165)),
            ),
            child: IconButton(
              onPressed: onPressed,
              icon: Icon(
                iconData2,
                size: ScreenSize.getScreenWidth(context) * 0.05,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

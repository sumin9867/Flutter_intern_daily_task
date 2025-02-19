import 'package:flutter/material.dart';
import 'package:photo_labs/presentation_layer/theme/screen_size.dart';

class CustomCounters extends StatelessWidget {
  final String labelText;
  final String data;

  const CustomCounters({
    Key? key,
    required this.data,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(ScreenSize.getScreenHeight(context) * 0.01),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Text(
            data.toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: ScreenSize.getScreenHeight(context) * 0.02,
            ),
          ),
          Text(
            labelText,
            style: TextStyle(
              color: Colors.white,
              fontSize: ScreenSize.getScreenHeight(context) * 0.02,
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/widgets.dart';
import 'package:movie_app/common/extension/size_extension.dart';

class LogoWidgets extends StatelessWidget {
  const LogoWidgets({super.key, required this.height});
  final double height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/pngs/logo.png",
      height: height.h,
    );
  }
}

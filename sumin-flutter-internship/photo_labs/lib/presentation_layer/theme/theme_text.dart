import 'package:flutter/material.dart';
import 'package:photo_labs/presentation_layer/theme/theme_color.dart';

class PhotoListSlugDesign {
  static const TextStyle style = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w700,
    fontSize: 14,
    color: Colors.white,
    height: 30 / 20,
    overflow: TextOverflow.ellipsis,
  );
}

class AppBarText {
  static const TextStyle style = TextStyle(
    color: Color.fromARGB(255, 255, 255, 255),
    fontSize: 18,
    fontWeight: FontWeight.w700,
    height: 30 / 20,
  );
}

class DetailText {
  static const TextStyle style = TextStyle(
    fontFamily: 'Poppins',
    color: Color.fromARGB(255, 255, 255, 255),
    fontSize: 16,
    height: 24 / 16,
  );
}

class HeadlineDetail {
  static const TextStyle style = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    color: Colors.white,
    fontSize: 18,
    height: 27 / 18,
  );
}

class HeadlineDetailsearch {
  static const TextStyle style = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    color: AppColor.iconColour,
    fontSize: 18,
    height: 27 / 18,
  );
}

class SplashBigText {
  static const TextStyle style = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 50,
    fontWeight: FontWeight.w800, color: Colors.white,
    height: 27 / 18, // 18px / 12px
  );
}

class SplashSmall {
  static const TextStyle style = TextStyle(
      fontFamily: 'Poppins',
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      height: 21 / 14);
}

class RandomCameraText {
  static const TextStyle style = TextStyle(
      fontFamily: 'Poppins',
      color: Color.fromARGB(255, 211, 209, 209),
      fontSize: 14,
      fontWeight: FontWeight.w500,
      height: 21 / 14);
}

class RandomUserText {
  static const TextStyle style = TextStyle(
      fontFamily: 'Poppins',
      color: Color.fromARGB(255, 255, 255, 255),
      fontSize: 24,
      fontWeight: FontWeight.w900,
      height: 21 / 14);
}

class Today {
  static const TextStyle style = TextStyle(
      fontFamily: 'Poppins',
      color: Color.fromARGB(255, 255, 255, 255),
      fontSize: 20,
      fontWeight: FontWeight.w500,
      height: 21 / 14);
}

class Head {
  static const TextStyle style = TextStyle(
      fontFamily: 'Poppins',
      color: Color.fromARGB(255, 255, 255, 255),
      fontSize: 24,
      fontWeight: FontWeight.w900,
      height: 21 / 14);
}

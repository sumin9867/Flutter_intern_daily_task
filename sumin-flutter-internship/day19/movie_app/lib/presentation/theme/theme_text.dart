import 'package:flutter/material.dart';
import 'package:movie_app/presentation/theme/theme_color.dart';

class HeadlineText {
  static const TextStyle style = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w700,
    fontSize: 24,
    color: Colors.white,
    height: 30 / 20,
  );
}

class NormalText {
  static const TextStyle style = TextStyle(
    color: Colors.white,
    fontSize: 14,
    height: 30 / 20,
  );
}

class SmallDetails {
  static const TextStyle style = TextStyle(
    fontFamily: 'Poppins',
    color: Color.fromARGB(255, 187, 186, 186),
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

class Body2 {
  static const TextStyle style = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12,
    fontWeight: FontWeight.w400, color: Colors.white,
    height: 1.5, // 18px / 12px
  );
}

class Body1 {
  static const TextStyle style = TextStyle(
      fontFamily: 'Poppins',
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      height: 21 / 14);
}

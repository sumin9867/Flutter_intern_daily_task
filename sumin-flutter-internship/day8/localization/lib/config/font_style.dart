import 'package:flutter/material.dart';

class Heading1 {
  static const TextStyle style = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w700,
    fontSize: 28,
    color: Colors.white,
    height: 24 / 28,
  );
}

class HintText {
  static const TextStyle style = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    color: Colors.black,
    fontSize: 16,
    height: 24 / 16,
  );
}

class Caption {
  static const TextStyle style = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    color: Colors.red,
    fontSize: 12,
    height: 16 / 12,
  );
}

class ButtonText {
  static const TextStyle style = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 21,
    fontWeight: FontWeight.w700, color: Colors.white,
    height: 21 / 21, // 18px / 12px
  );
}

class Options {
  static const TextStyle style = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.w300,
      letterSpacing: 1,
      height: 21 / 16);
}

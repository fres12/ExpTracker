import 'package:flutter/material.dart';

class TColors {
  TColors();

  static const Color primary = Color(0xFF327AC9);
  static const Color black = Color(0xFF141A1E);
  static const Color greynavbar = Color(0xFF616161);
  static const Color birumuda = Color.fromRGBO(232, 243, 255, 1);

  static const Color subtitle = Color(0xFFABA4A4);
  static const Color outline = Color(0xFFDEE8F5);
  static const Color background = Color(0xFFF5F5F5);
  static const Color white = Color.fromRGBO(255, 255, 255, 1);

  static const Color sisadikit = Color(0xFFF4A454);
  static const Color sisasedang = Color(0xFFDBBF09);
  static const Color sisagood = Color(0xFF61BA75);
  static const Color exp = Color(0xFFF45454);
}

class TPosition {
  TPosition._();

  static const EdgeInsets paddingPageDefault = EdgeInsets.only(
    left: 28,
    right: 28,
    top: 16,
  );

  static const EdgeInsets marginPageDefault = EdgeInsets.only(
    left: 28,
    right: 28,
    top: 16,
    bottom: 28,
  );

  static const EdgeInsets topnavbar = EdgeInsets.only(
    left: 13,
    right: 13,
  );

  static const EdgeInsets containerItem = EdgeInsets.only(
    top: 4,
    bottom: 4,
  );
  static const EdgeInsets listItem =
      EdgeInsets.only(bottom: 6, left: 20, right: 20, top: 6);
}

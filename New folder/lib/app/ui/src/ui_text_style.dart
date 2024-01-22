// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class UITextStyle {
  final _fontFamily = 'Roboto';
  final fontLicense = 'assets/fonts/LICENSE.txt';
  // late final _textColor = Theme.of(Get.context!).textTheme.titleLarge!.color;

  late final Custom = TextStyle(
    fontFamily: _fontFamily,
    // color: _textColor,
  );

  late final H1 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 30,
    // color: _textColor,
  );

  late final H2 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 24,
    // color: _textColor,
  );

  late final H3 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 20,
    // color: _textColor,
  );

  late final H4 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 18,
    // color: _textColor,
  );

  late final Title = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    // color: _textColor,
  );

  late final Body = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    // color: _textColor,
  );

  late final Label = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 13,
    // color: _textColor,
  );

  late final Caption = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    // color: _textColor,
  );
}

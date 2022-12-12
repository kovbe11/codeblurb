import 'package:codeblurb/core/app_colors.dart';
import 'package:codeblurb/core/app_ui_constants.dart';
import 'package:flutter/material.dart';

part "input_decoration_theme.dart";

abstract class AppTheme {
  static get light => ThemeData(inputDecorationTheme: _kInputDecorationTheme);
  static get dark =>
      ThemeData.dark().copyWith(inputDecorationTheme: _kInputDecorationTheme);
  //up for later customization
}

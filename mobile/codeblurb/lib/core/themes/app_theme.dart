import 'package:codeblurb/core/app_colors.dart';
import 'package:codeblurb/core/app_ui_constants.dart';
import 'package:flutter/material.dart';

part "input_decoration_theme.dart";

abstract class AppTheme {
  static get light => ThemeData(inputDecorationTheme: _kInputDecorationTheme);
  static get dark => ThemeData.dark().copyWith(
        inputDecorationTheme: _kInputDecorationTheme,
        appBarTheme: const AppBarTheme(
          color: AppColors.baseDark,
          elevation: 15,
        ),
        scaffoldBackgroundColor: AppColors.baseDark,
        dividerColor: Colors.transparent,
        expansionTileTheme: const ExpansionTileThemeData(
          childrenPadding: EdgeInsets.zero,
          tilePadding: EdgeInsets.symmetric(horizontal: 15),
          collapsedIconColor: AppColors.baseLightGrey,
          expandedAlignment: Alignment.topCenter,
          iconColor: null,
          backgroundColor: AppColors.baseDarkGrey,
          collapsedBackgroundColor: AppColors.baseDarkGrey,
        ),
      );

  //up for later customization
}

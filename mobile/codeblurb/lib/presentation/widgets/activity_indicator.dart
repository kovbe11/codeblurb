import 'package:codeblurb/core/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget activityIndicatorBuilder(BuildContext _) => const ActivityIndicator();

class ActivityIndicator extends StatelessWidget {
  const ActivityIndicator({
    Key? key,
    this.isLight = false,
    this.strokeWidth = 4.0,
  }) : super(key: key);

  final bool isLight;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return CupertinoTheme(
      data: CupertinoThemeData(
          brightness: isLight ? Brightness.dark : Brightness.light),
      child: Center(
        child: CircularProgressIndicator.adaptive(
          strokeWidth: strokeWidth,
          valueColor: AlwaysStoppedAnimation(
            isLight ? AppColors.baseBlue : AppColors.baseDarkGrey,
          ),
        ),
      ),
    );
  }
}

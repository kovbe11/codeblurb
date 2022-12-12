import 'package:codeblurb/core/app_colors.dart';
import 'package:codeblurb/core/app_ui_constants.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.title,
    this.onTap,
    this.icon,
  }) : super(key: key);

  final String title;
  final Widget? icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final style = ElevatedButton.styleFrom(
      foregroundColor: AppColors.baseLightGrey,
      backgroundColor: AppColors.baseBlue,
      shadowColor: AppColors.baseDark,
      side: const BorderSide(color: AppColors.baseDarkGrey),
      surfaceTintColor: Colors.white,
      minimumSize: const Size.fromHeight(60),
      shape: const RoundedRectangleBorder(
          borderRadius: AppUIConstants.borderCircular30),
    );

    return icon != null
        ? ElevatedButton.icon(
            style: style, onPressed: onTap, label: Text(title), icon: icon!)
        : ElevatedButton(
            style: style,
            onPressed: onTap,
            child: Text(title),
          );
  }
}

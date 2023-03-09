import 'package:codeblurb/core/app_colors.dart';
import 'package:codeblurb/generated/l10n.dart';
import 'package:flutter/material.dart';

class AppProgressBar extends StatelessWidget {
  const AppProgressBar({
    Key? key,
    required this.progress,
    this.progressBarColor,
    this.backgroundColor,
  }) : super(key: key);

  final double progress;
  final Color? progressBarColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    return Column(
      children: [
        TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOutSine,
          tween: Tween<double>(begin: 0, end: progress.clamp(0, 1)),
          builder: (_, value, child) {
            final percentage = (value * 100).round();
            return Column(
              children: [
                LinearProgressIndicator(
                  value: value,
                  backgroundColor: backgroundColor ?? AppColors.baseDarkGrey,
                  color: progressBarColor ?? AppColors.baseBlue,
                ),
                Text(
                  percentage < 100
                      ? l10n.percentageComplete(percentage)
                      : l10n.completed,
                )
              ],
            );
          },
        ),
      ],
    );
  }
}

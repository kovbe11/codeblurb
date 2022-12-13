import 'package:codeblurb/core/app_colors.dart';
import 'package:codeblurb/core/app_ui_constants.dart';
import 'package:flutter/material.dart';

class TaskDescriptionSection extends StatelessWidget {
  const TaskDescriptionSection({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: AppUIConstants.borderCircular6,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.baseDarkGrey,
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
          borderRadius: AppUIConstants.borderCircular6,
        ),
        child: Padding(padding: const EdgeInsets.all(15), child: child),
      ),
    );
  }
}

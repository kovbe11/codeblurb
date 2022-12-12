import 'package:auto_route/auto_route.dart';
import 'package:codeblurb/core/app_colors.dart';
import 'package:codeblurb/generated/l10n.dart';
import 'package:codeblurb/presentation/extensions/date_x.dart';
import 'package:codeblurb/router/app_router.dart';
import 'package:flutter/material.dart';

class CourseCreationSection extends StatelessWidget {
  const CourseCreationSection({
    super.key,
    required this.creatorName,
    required this.lastUpdated,
  });

  final String creatorName;
  final DateTime lastUpdated;

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    const style = TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
    return Column(children: [
      Row(
        children: [
          Text(l10n.createdBy, style: style),
          TextButton(
            onPressed: () => context.router.push(const CreatorProfileRoute()),
            child: Text(
              creatorName,
              style: style.copyWith(color: AppColors.baseBlue),
            ),
          ),
        ],
      ),
      Row(
        children: [
          const Icon(Icons.upload),
          const SizedBox(width: 5),
          Text(l10n.lastUpdated(lastUpdated.monthAndYear))
        ],
      ),
      const SizedBox(height: 3),
      Row(
        children: [
          const Icon(Icons.language),
          const SizedBox(width: 5),
          Text(l10n.english),
        ],
      )
    ]);
  }
}

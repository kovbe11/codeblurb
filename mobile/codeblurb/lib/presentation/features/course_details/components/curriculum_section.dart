import 'package:codeblurb/generated/l10n.dart';
import 'package:codeblurb/presentation/features/course_details/components/curriculum_section_item.dart';
import 'package:flutter/material.dart';

class CurriculumSection extends StatelessWidget {
  CurriculumSection({super.key});

  final items = [
    'Video',
    "Coding",
    "Quiz",
    'Video',
    "Coding",
    "Quiz",
    'Video',
    "Coding",
    "Quiz",
    'Video',
    "Coding",
    "Quiz",
    'Video',
    "Coding",
    "Quiz",
    'Video',
    "Coding",
    "Quiz",
    'Video',
    "Coding",
    "Quiz",
    'Video',
    "Coding",
    "Quiz",
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              l10n.curriculum,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 3),
            Text(l10n.curriculumContent(12, 9)),
          ],
        ),
        const SizedBox(height: 15),
        ListView.builder(
          itemCount: items.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) => CurriculumSectionItem(
            index: index + 1,
            type: items[index],
            key: Key(index.toString()),
          ),
        )
      ],
    );
  }
}

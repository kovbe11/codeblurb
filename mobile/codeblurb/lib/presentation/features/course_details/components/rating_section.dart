import 'package:codeblurb/generated/l10n.dart';
import 'package:codeblurb/presentation/widgets/rating_view.dart';
import 'package:flutter/material.dart';

class RatingSection extends StatelessWidget {
  const RatingSection({
    super.key,
    required this.rating,
    required this.raterCount,
    required this.totalStudentCount,
  });

  final double rating;
  final int raterCount;
  final int totalStudentCount;

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              rating.toStringAsFixed(1),
              style: const TextStyle(
                color: Colors.amber,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 5),
            RatingView(
              initialRating: rating,
              itemSize: 20,
            )
          ],
        ),
        const SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              l10n.ratingsCount(raterCount),
            ),
            Text(
              l10n.studentsCount(totalStudentCount),
            )
          ],
        )
      ],
    );
  }
}

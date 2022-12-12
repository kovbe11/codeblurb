import 'package:codeblurb/presentation/widgets/rating_view.dart';
import 'package:flutter/material.dart';

class RatingSection extends StatelessWidget {
  const RatingSection({super.key, required this.rating});

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              rating.toString(),
              style: const TextStyle(
                color: Colors.amber,
              ),
            ),
            const RatingView(
              initialRating: 4.6,
              itemSize: 20,
            )
          ],
        ),
        const Text("trololo")
      ],
    );
  }
}

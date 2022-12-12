import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingView extends StatelessWidget {
  const RatingView({
    super.key,
    this.initialRating,
    this.canRate = false,
    this.itemSize = 10,
    this.itemPadding = 0,
  });

  final double? initialRating;
  final bool canRate;
  final double itemSize;
  final double itemPadding;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: initialRating ?? 0,
      minRating: 1,
      itemSize: itemSize,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(horizontal: itemPadding),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      ignoreGestures: canRate,
      onRatingUpdate: (rating) {},
    );
  }
}

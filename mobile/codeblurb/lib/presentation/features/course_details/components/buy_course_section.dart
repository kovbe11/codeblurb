import 'package:auto_route/auto_route.dart';
import 'package:codeblurb/core/app_colors.dart';
import 'package:codeblurb/generated/l10n.dart';
import 'package:codeblurb/presentation/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class BuyCourseSection extends StatelessWidget {
  const BuyCourseSection({
    super.key,
    required this.originalPrice,
    this.discountedPrice,
    this.daysLeftOfOffer,
  });

  final double originalPrice;
  final double? discountedPrice;
  final int? daysLeftOfOffer;

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final discountPercentage =
        ((1 - (discountedPrice ?? 0) / originalPrice) * 100).round();
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '${(discountedPrice ?? originalPrice).toStringAsFixed(2)}\$',
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 10),
            if (discountedPrice != null)
              Text(
                '${originalPrice.toStringAsFixed(2)}\$',
                style: TextStyle(
                  fontSize: 20,
                  decoration: TextDecoration.lineThrough,
                  color: AppColors.baseLightGrey.withOpacity(0.8),
                ),
              ),
          ],
        ),
        if (discountedPrice != null && daysLeftOfOffer != null) ...[
          const SizedBox(height: 6),
          Row(
            children: [
              Icon(
                Icons.alarm,
                color: Colors.red.shade300,
              ),
              const SizedBox(width: 5),
              Text(
                l10n.deal(discountPercentage, daysLeftOfOffer!),
                style: TextStyle(
                  color: Colors.red.shade300,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ],
        const SizedBox(height: 10),
        PrimaryButton(
          title: l10n.buyNow,
          onTap: context.router.pop,
        )
      ],
    );
  }
}

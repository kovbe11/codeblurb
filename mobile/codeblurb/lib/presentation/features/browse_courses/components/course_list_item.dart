import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:codeblurb/core/app_colors.dart';
import 'package:codeblurb/data/shopping/models/shopping_item_response.dart';
import 'package:codeblurb/presentation/widgets/app_list_tile.dart';
import 'package:codeblurb/presentation/widgets/rating_view.dart';
import 'package:codeblurb/router/app_router.dart';
import 'package:flutter/material.dart';

class CourseListItem extends StatelessWidget {
  const CourseListItem({
    required this.shoppingItem,
    super.key,
  });

  final ShoppingItemResponse shoppingItem;
  @override
  Widget build(BuildContext context) {
    return AppListTile(
      onTap: () => context.router.push(const CourseDetailsRoute()),
      imageUrl: shoppingItem.imageUrl,
      cardContent: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  shoppingItem.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(
                  shoppingItem.instructorNames.join(', '),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(color: AppColors.baseBlue),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RatingView(initialRating: Random().nextDouble() * 5),
              Text("${shoppingItem.price}\$"),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:auto_route/auto_route.dart';
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
      imageUrl:
          'https://images.unsplash.com/photo-1670481382179-3968ad563542?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1441&q=80',
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
                const Text(
                  "Denis Panjuta, Angela Yu",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
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
              const RatingView(initialRating: 2),
              Text("${shoppingItem.price}\$"),
            ],
          ),
        ),
      ],
    );
  }
}

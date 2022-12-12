import 'package:auto_route/auto_route.dart';
import 'package:codeblurb/data/shopping/models/shopping_item_response.dart';
import 'package:codeblurb/presentation/widgets/app_list_tile.dart';
import 'package:codeblurb/presentation/widgets/app_progress_bar.dart';
import 'package:codeblurb/router/app_router.dart';
import 'package:flutter/material.dart';

class MyCoursesListItem extends StatelessWidget {
  const MyCoursesListItem({
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                shoppingItem.title,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              const AppProgressBar(progress: 0.8)
            ],
          ),
        )
      ],
    );
  }
}

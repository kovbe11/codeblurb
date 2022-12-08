import 'package:codeblurb/data/shopping/models/minimal_content_bundle_response.dart';
import 'package:codeblurb/data/shopping/models/shopping_item_response.dart';
import 'package:codeblurb/presentation/widgets/course_list_item.dart';
import 'package:flutter/material.dart';

class BrowseCoursesScreen extends StatelessWidget {
  BrowseCoursesScreen({super.key});

  final shoppingItems = [
    ShoppingItemResponse(
      1,
      "Course 1",
      9.99,
      MinimalContentBundleResponse([]),
    ),
    ShoppingItemResponse(
      2,
      "Course 2",
      9.99,
      MinimalContentBundleResponse([]),
    ),
    ShoppingItemResponse(
      3,
      "Course 3",
      9.99,
      MinimalContentBundleResponse([]),
    ),
    ShoppingItemResponse(
      4,
      "Course 4",
      9.99,
      MinimalContentBundleResponse([]),
    ),
    ShoppingItemResponse(
      5,
      "Course 5",
      9.99,
      MinimalContentBundleResponse([]),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Browse Courses'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                  itemCount: shoppingItems.length,
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 12.0,
                      ),
                  itemBuilder: (_, index) =>
                      CourseListItem(shoppingItem: shoppingItems[index])),
            ),
          ],
        ),
      ),
    );
  }
}
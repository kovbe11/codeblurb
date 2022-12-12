import 'package:codeblurb/data/shopping/models/minimal_content_bundle_response.dart';
import 'package:codeblurb/data/shopping/models/shopping_item_response.dart';
import 'package:codeblurb/presentation/features/my_courses/components/my_courses_list_item.dart';
import 'package:flutter/material.dart';

class MyCoursesScreen extends StatelessWidget {
  MyCoursesScreen({super.key});

  final item = ShoppingItemResponse(
    5,
    "Course 5",
    9.99,
    MinimalContentBundleResponse([]),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Courses')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                itemCount: 12,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 12.0,
                ),
                itemBuilder: (_, index) =>
                    MyCoursesListItem(shoppingItem: item),
              ),
              // const SizedBox(height: 10)),
            ),
          ],
        ),
      ),
    );
  }
}

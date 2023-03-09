import 'package:auto_route/auto_route.dart';
import 'package:codeblurb/data/shopping/models/minimal_content_bundle_response.dart';
import 'package:codeblurb/data/shopping/models/shopping_item_response.dart';
import 'package:codeblurb/presentation/features/browse_courses/components/course_list_item.dart';
import 'package:codeblurb/router/app_router.dart';
import 'package:flutter/material.dart';

class BrowseCoursesScreen extends StatelessWidget {
  BrowseCoursesScreen({super.key});

  final shoppingItems = [
    ShoppingItemResponse(
      1,
      "The Complete Web Development Bootcamp",
      29.99,
      MinimalContentBundleResponse([]),
      'https://miro.medium.com/max/750/0*KlN28Ht5Jcyup-VA.jpg',
      ["Colt Steele"],
    ),
    ShoppingItemResponse(
      2,
      "Algorithms And Data Structures With Python",
      9.99,
      MinimalContentBundleResponse([]),
      'https://courses.wscubetech.com/s/store/courses/612c9e860cf2b183bad3c610/cover.jpg?v=1',
      ["Angela Yu"],
    ),
    ShoppingItemResponse(
      3,
      "That Weird Javascript Course",
      9.99,
      MinimalContentBundleResponse([]),
      'https://fireship.io/courses/js/img/featured.webp',
      ["Jeff Delaney"],
    ),
    ShoppingItemResponse(
      4,
      "Kotlin In a nutshell",
      9.99,
      MinimalContentBundleResponse([]),
      'https://kotlinlang.org/assets/images/twitter/general.png',
      ["Marton Braun"],
    ),
    ShoppingItemResponse(
      5,
      "Build Web Applications With SvelteKit",
      9.99,
      MinimalContentBundleResponse([]),
      'https://www.freecodecamp.org/news/content/images/2022/10/svelte-1.png',
      ["Chinese Brad Traversy"],
    ),
    ShoppingItemResponse(
      5,
      "State Management With Flutter Riverpod",
      9.99,
      MinimalContentBundleResponse([]),
      'https://fireship.io/lessons/firebase-riverpod-flutter/img/featured.png',
      ["Remi Rousselet"],
    ),
    ShoppingItemResponse(
      5,
      "Flutter BloC - The Course",
      9.99,
      MinimalContentBundleResponse([]),
      'https://i.ytimg.com/vi/oxeYeMHVLII/maxresdefault.jpg',
      ['Felix Angelov', "Very Good Ventures"],
    ),
    ShoppingItemResponse(
      1,
      "The Complete Web Development Bootcamp",
      29.99,
      MinimalContentBundleResponse([]),
      'https://miro.medium.com/max/750/0*KlN28Ht5Jcyup-VA.jpg',
      ["Colt Steele"],
    ),
    ShoppingItemResponse(
      2,
      "Algorithms And Data Structures With Python",
      9.99,
      MinimalContentBundleResponse([]),
      'https://courses.wscubetech.com/s/store/courses/612c9e860cf2b183bad3c610/cover.jpg?v=1',
      ["Angela Yu"],
    ),
    ShoppingItemResponse(
      3,
      "That Weird Javascript Course",
      9.99,
      MinimalContentBundleResponse([]),
      'https://fireship.io/courses/js/img/featured.webp',
      ["Jeff Delaney"],
    ),
    ShoppingItemResponse(
      4,
      "Kotlin In a nutshell",
      9.99,
      MinimalContentBundleResponse([]),
      'https://kotlinlang.org/assets/images/twitter/general.png',
      ["Marton Braun"],
    ),
    ShoppingItemResponse(
      5,
      "Build Modern Web Applications With SvelteKit",
      9.99,
      MinimalContentBundleResponse([]),
      'https://www.freecodecamp.org/news/content/images/2022/10/svelte-1.png',
      ["Chinese Brad Traversy"],
    ),
    ShoppingItemResponse(
      5,
      "State Management With Flutter Riverpod",
      9.99,
      MinimalContentBundleResponse([]),
      'https://fireship.io/lessons/firebase-riverpod-flutter/img/featured.png',
      ["Remi Rousselet"],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Browse Courses'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: (() => context.router.push(
                  const ShoppingCartRoute(),
                )),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                itemCount: shoppingItems.length,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 12.0,
                ),
                itemBuilder: (_, index) => CourseListItem(
                  shoppingItem: shoppingItems[index],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:codeblurb/data/shopping/models/shopping_item_response.dart';
import 'package:flutter/material.dart';

class CourseListItem extends StatelessWidget {
  const CourseListItem({
    required this.shoppingItem,
    super.key,
  });

  final ShoppingItemResponse shoppingItem;
  static const _imageSize = 80.0;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(6.0)),
        child: SizedBox(
          height: _imageSize,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            CachedNetworkImage(
              fit: BoxFit.cover,
              width: _imageSize,
              height: _imageSize,
              imageUrl:
                  'https://images.unsplash.com/photo-1670481382179-3968ad563542?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1441&q=80',
            ),
            Column(
              children: [
                Text(shoppingItem.title),
                const Text(
                  "this is the g ; hkas",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
            Text("${shoppingItem.price}\$"),
          ]),
        ),
      ),
    );
    //   return ListTile(
    //     tileColor: Colors.green,
    //     leading: CachedNetworkImage(
    //       imageUrl:
    //           'https://images.unsplash.com/photo-1670481382179-3968ad563542?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1441&q=80',
    //     ),
    //     title: Text(shoppingItem.title),
    //     trailing: Text("${shoppingItem.price}\$"),
    //   );
  }
}

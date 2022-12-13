import 'package:auto_route/auto_route.dart';
import 'package:codeblurb/presentation/widgets/app_list_tile.dart';
import 'package:codeblurb/router/app_router.dart';
import 'package:flutter/material.dart';

class CurriculumSectionItem extends StatelessWidget {
  const CurriculumSectionItem({
    super.key,
    required this.index,
    required this.type,
  });

  final int index;
  final String type;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: AppListTile(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        height: 55,
        onTap: () => context.router.push(const CodingTaskTabsRoute()),
        cardContent: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              index.toString(),
              style: const TextStyle(fontSize: 22),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'section title',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 3),
              Text(
                type,
                style: const TextStyle(fontSize: 13),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

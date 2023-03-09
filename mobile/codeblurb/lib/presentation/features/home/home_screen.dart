import 'package:auto_route/auto_route.dart';
import 'package:codeblurb/core/app_colors.dart';
import 'package:codeblurb/presentation/features/home/tab_type.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      key: const Key('home_screen'),
      context: context,
      // removeTop: true,
      child: AutoTabsScaffold(
        animationDuration: Duration.zero,
        routes: TabType.values.map((tabType) => tabType.route).toList(),
        bottomNavigationBuilder: (_, tabsRouter) {
          return Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                    color: AppColors.baseBlue.withOpacity(0.6), width: 1),
              ),
            ),
            child: BottomNavigationBar(
              selectedItemColor: AppColors.baseBlue,
              backgroundColor: AppColors.baseDark,
              elevation: 20,
              items: TabType.values
                  .map(
                    (tabType) => BottomNavigationBarItem(
                      icon: Icon(tabType.icon),
                      label: tabType.label,
                    ),
                  )
                  .toList(),
              currentIndex: tabsRouter.activeIndex,
              onTap: tabsRouter.setActiveIndex,
            ),
          );
        },
      ),
    );
  }
}

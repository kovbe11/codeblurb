import 'package:auto_route/auto_route.dart';
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
          return BottomNavigationBar(
            elevation: 10,
            items: TabType.values
                .map(
                  (tabType) => const BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: ''),
                )
                .toList(),
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
          );
        },
      ),
    );
  }
}

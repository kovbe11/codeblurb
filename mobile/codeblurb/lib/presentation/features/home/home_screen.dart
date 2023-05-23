import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:codeblurb/core/app_colors.dart';
import 'package:codeblurb/data/auth/auth_repository.dart';
import 'package:codeblurb/data/common/network/dio.dart';
import 'package:codeblurb/presentation/features/home/tab_type.dart';
import 'package:codeblurb/router/app_router.dart';
import 'package:codeblurb/utils/platform_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    ref.listen(errorProvider, (previous, next) {
      showDialog<void>(
        context: context,
        builder: (_) => PlatformDialog(
          title: 'Session expired',
          onTap: () async {
            await ref.read(authRepoProvider).logout();
            if (!mounted) return;
            unawaited(context.router.replaceAll([const LoginRoute()]));
          },
        ),
      );
    });
    return MediaQuery.removePadding(
      key: const Key('home_screen'),
      context: context,
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

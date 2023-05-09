import 'package:auto_route/annotations.dart';
import 'package:codeblurb/core/app_colors.dart';
import 'package:codeblurb/presentation/features/code_editing/code_editing_screen.dart';
import 'package:codeblurb/presentation/features/coding_task/components/coding_problem_tab.dart';
import 'package:codeblurb/presentation/features/coding_task/components/results_tab.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CodingTaskTabsScreen extends StatelessWidget {
  const CodingTaskTabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Builder(builder: (context) {
        final controller = DefaultTabController.of(context);
        controller.addListener(() {
          if (controller.index != 1) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        });
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            bottom: const TabBar(
              indicatorColor: AppColors.baseBlue,
              tabs: [
                Tab(icon: Icon(Icons.golf_course_sharp), text: "Problem"),
                Tab(icon: Icon(Icons.code), text: "Code"),
                Tab(icon: Icon(Icons.text_increase_sharp), text: "Results"),
              ],
            ),
            title: const Text('Coding task 1'),
          ),
          body: const TabBarView(
            children: [
              CodingProblemTab(),
              CodeEditingScreen(),
              ResultsTab(),
            ],
          ),
        );
      }),
    );
  }
}

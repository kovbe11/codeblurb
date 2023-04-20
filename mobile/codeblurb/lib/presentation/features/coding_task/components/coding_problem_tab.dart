import 'package:codeblurb/generated/l10n.dart';
import 'package:codeblurb/presentation/features/coding_task/components/help_section.dart';
import 'package:codeblurb/presentation/features/coding_task/components/task_description_section.dart';
import 'package:codeblurb/presentation/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class CodingProblemTab extends StatelessWidget {
  const CodingProblemTab({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your first Java program",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10),
                const TaskDescriptionSection(
                  child: Text.rich(
                    TextSpan(
                      text:
                          "Let's write our first Java program!\nCreate a program to output the text ",
                      children: [
                        TextSpan(
                          text: '"Java is great"',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: ' to the screen.')
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                const HelpSection(),
              ],
            ),
          ),
          const Spacer(),
          PrimaryButton(
            title: l10n.startChallenge,
            onTap: () => DefaultTabController.of(context).animateTo(1),
          ),
          SizedBox(height: bottomPadding)
        ],
      ),
    );
  }
}

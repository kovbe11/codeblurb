import 'package:codeblurb/presentation/features/coding_task/components/hint_item.dart';
import 'package:codeblurb/presentation/features/coding_task/components/warning_item.dart';
import 'package:flutter/material.dart';

class HelpSection extends StatelessWidget {
  const HelpSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        HintItem(
          content: Text.rich(
            TextSpan(
              text: 'Use ',
              children: [
                TextSpan(
                  text: 'System.out.println()',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(text: ' for output')
              ],
            ),
          ),
        ),
        SizedBox(height: 15),
        WarningItem(
          content: Text.rich(
            TextSpan(
              text: 'Wrap the message between ',
              children: [
                TextSpan(
                  text: '""',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(text: ' symbols.'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

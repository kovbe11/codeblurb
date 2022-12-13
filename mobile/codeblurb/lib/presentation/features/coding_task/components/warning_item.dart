import 'package:flutter/material.dart';

class WarningItem extends StatelessWidget {
  const WarningItem(
      {super.key, required this.content, this.icon = Icons.warning_sharp});

  final Widget content;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 34,
          color: Colors.red.shade400,
        ),
        const SizedBox(width: 15),
        Expanded(
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.red.shade400.withOpacity(0.5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: content,
            ),
          ),
        ),
      ],
    );
  }
}

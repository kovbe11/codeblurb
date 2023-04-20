part of "../code_editing_screen.dart";

class _CharacterInsertionButtonRow extends ConsumerWidget {
  const _CharacterInsertionButtonRow(
      {required this.onUnfocus, required this.onRunCode});

  final VoidCallback onUnfocus;
  final VoidCallback onRunCode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(codeEditingNotifierProvider("").notifier);
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    return ColoredBox(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: EdgeInsets.only(bottom: bottomPadding),
        child: Row(
          children: [
            Expanded(
              flex: 6,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _CharacterInsertionButton(
                      onTap: onUnfocus,
                      icon: Icons.keyboard_hide_outlined,
                    ),
                    _CharacterInsertionButton(
                      buttonText: "{",
                      onTap: notifier.insertCurlyBraces,
                    ),
                    _CharacterInsertionButton(
                      buttonText: "}",
                      onTap: () => notifier.insertCode("}"),
                    ),
                    _CharacterInsertionButton(
                      buttonText: ";",
                      onTap: () => notifier.insertCode(";"),
                    ),
                    _CharacterInsertionButton(
                      buttonText: '"',
                      onTap: notifier.insertQuotes,
                    ),
                    _CharacterInsertionButton(
                      buttonText: ".",
                      onTap: () => notifier.insertCode("."),
                    ),
                    _CharacterInsertionButton(
                      buttonText: "[",
                      onTap: notifier.insertSquareBrackets,
                    ),
                    _CharacterInsertionButton(
                      buttonText: "]",
                      onTap: () => notifier.insertCode("]"),
                    ),
                    _CharacterInsertionButton(
                      buttonText: "(",
                      onTap: notifier.insertParentheses,
                    ),
                    _CharacterInsertionButton(
                      buttonText: ")",
                      onTap: () => notifier.insertCode(")"),
                    ),
                    _CharacterInsertionButton(
                      buttonText: "=",
                      onTap: notifier.insertEqualSign,
                    ),
                    _CharacterInsertionButton(
                      buttonText: "TAB",
                      onTap: notifier.insertTab,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: AppUIConstants.borderCircular6,
                      color: Colors.green.shade400,
                    ),
                    child: IconButton(
                      onPressed: onRunCode,
                      icon: Icon(Icons.play_arrow_rounded,
                          color: Theme.of(context).scaffoldBackgroundColor),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

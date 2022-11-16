part of "../code_editing_screen.dart";

class _CharacterInsertionButtonRow extends ConsumerWidget {
  const _CharacterInsertionButtonRow();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(codeEditingNotifierProvider.notifier);
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    return ColoredBox(
      color: Colors.amber,
      child: Padding(
        padding: EdgeInsets.only(bottom: bottomPadding),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _CharacterInsertionButton(
                buttonText: "{",
                onTap: notifier.insertCurlyBraces,
              ),
              _CharacterInsertionButton(
                buttonText: "[",
                onTap: notifier.insertSquareBrackets,
              ),
              _CharacterInsertionButton(
                buttonText: "(",
                onTap: notifier.insertParentheses,
              ),
              _CharacterInsertionButton(
                buttonText: ";",
                onTap: notifier.insertSemicolon,
              ),
              _CharacterInsertionButton(
                buttonText: "=",
                onTap: notifier.insertEqualSign,
              ),
              _CharacterInsertionButton(
                buttonText: "TAB",
                onTap: notifier.insertTab,
              ),
              _CharacterInsertionButton(
                buttonText: "{",
                onTap: notifier.insertCurlyBraces,
              ),
              _CharacterInsertionButton(
                buttonText: "[",
                onTap: notifier.insertSquareBrackets,
              ),
              _CharacterInsertionButton(
                buttonText: "(",
                onTap: notifier.insertParentheses,
              ),
              _CharacterInsertionButton(
                buttonText: ";",
                onTap: notifier.insertSemicolon,
              ),
              _CharacterInsertionButton(
                buttonText: "=",
                onTap: notifier.insertEqualSign,
              ),
              _CharacterInsertionButton(
                buttonText: "TAB",
                onTap: notifier.insertTab,
              ),
              _CharacterInsertionButton(
                buttonText: "{",
                onTap: notifier.insertCurlyBraces,
              ),
              _CharacterInsertionButton(
                buttonText: "[",
                onTap: notifier.insertSquareBrackets,
              ),
              _CharacterInsertionButton(
                buttonText: "(",
                onTap: notifier.insertParentheses,
              ),
              _CharacterInsertionButton(
                buttonText: ";",
                onTap: notifier.insertSemicolon,
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
    );
  }
}

part of "../code_editing_screen.dart";

class _CharacterInsertionButtonRow extends ConsumerWidget {
  const _CharacterInsertionButtonRow();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Row(
        children: [
          SizedBox(
              height: 20,
              width: 15,
              child: ElevatedButton(
                child: const Text('{'),
                onPressed: () {},
              ))
        ],
      ),
    );
  }
}

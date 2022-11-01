part of "../code_editing_screen.dart";

class _CharacterInsertionButton extends StatelessWidget {
  const _CharacterInsertionButton(
      {required this.buttonText, required this.onTap});

  final String buttonText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(5)),
        height: 40,
        width: 30,
        child: Text(buttonText),
      ),
    );
  }
}

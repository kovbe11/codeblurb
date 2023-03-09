part of "../code_editing_screen.dart";

class _CharacterInsertionButton extends StatelessWidget {
  const _CharacterInsertionButton(
      {this.buttonText, required this.onTap, this.icon});

  final String? buttonText;
  final IconData? icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.baseBlue,
          borderRadius: BorderRadius.circular(5),
        ),
        child: SizedBox(
          height: 40,
          width: 33,
          child: icon != null
              ? Icon(icon)
              : ColoredBox(
                  color: Colors.transparent,
                  child: Center(
                    child: AutoSizeText(
                      buttonText ?? "",
                      minFontSize: buttonText?.length == 1 ? 20 : 15,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}

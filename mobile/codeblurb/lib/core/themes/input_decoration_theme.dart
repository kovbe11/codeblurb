part of './app_theme.dart';

final _kInputDecorationTheme = InputDecorationTheme(
  errorStyle: TextStyle(color: Colors.red.shade300),
  enabledBorder: const OutlineInputBorder(
    borderRadius: AppUIConstants.borderCircular6,
    borderSide: BorderSide(color: AppColors.baseLightGrey),
  ),
  focusedBorder: const OutlineInputBorder(
    borderRadius: AppUIConstants.borderCircular6,
    borderSide: BorderSide(color: AppColors.baseBlue),
  ),
  hintStyle: const TextStyle(
    fontSize: 16,
    color: AppColors.baseDarkGrey,
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: AppUIConstants.borderCircular6,
    borderSide: BorderSide(color: Colors.red.shade300),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: AppUIConstants.borderCircular6,
    borderSide: BorderSide(color: Colors.red.shade300),
  ),
);

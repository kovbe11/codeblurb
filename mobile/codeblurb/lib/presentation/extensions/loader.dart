import 'package:codeblurb/presentation/utils/view_state.dart';
import 'package:codeblurb/presentation/widgets/overlay_loader.dart';
import 'package:flutter/material.dart';

extension Loader on ViewState {
  void bindLoader(
    BuildContext context, {
    VoidCallback? onSuccess,
    void Function(String)? onError,
  }) {
    maybeWhen(
      data: (_) {
        OverlayLoader.hide();
        onSuccess?.call();
      },
      loading: () => OverlayLoader.show(context),
      error: (message) {
        OverlayLoader.hide();
        onError?.call(message);
      },
      orElse: OverlayLoader.hide,
    );
  }

  // void showSnackBarOnError(
  //   BuildContext context,
  //   VoidCallback onClose,
  // ) {
  //   whenOrNull(
  //       error: (message, _) => context
  //           .showSnackBar(
  //             SnackBarFailureView(customText: message),
  //             backgroundColor: AppColors.dangerRedLight,
  //           )
  //           .closed
  //           .whenComplete(onClose));
  // }
}

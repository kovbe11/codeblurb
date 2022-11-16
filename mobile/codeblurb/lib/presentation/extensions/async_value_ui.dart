import 'package:codeblurb/presentation/widgets/overlay_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension AsyncValueUI on AsyncValue<void> {
  void bindLoader(BuildContext context) =>
      isLoading ? OverlayLoader.show(context) : OverlayLoader.hide();
}

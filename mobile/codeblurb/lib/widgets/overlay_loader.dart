import 'package:flutter/material.dart';

class OverlayLoader {
  static OverlayEntry? _currentLoader;
  static void show(
    BuildContext context, {
    Color overlayColor = const Color(0x99ffffff),
  }) {
    if (_currentLoader != null) return;
    _currentLoader = OverlayEntry(
      builder: (context) => Stack(
        children: <Widget>[
          Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: overlayColor),
          const Center(
            child: CircularProgressIndicator.adaptive(),
          )
        ],
      ),
    );
    Overlay.of(context).insert(_currentLoader!);
  }

  static void hide() {
    try {
      _currentLoader?.remove();
      _currentLoader = null;
    } catch (error) {
      // DO NOTHING
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class CodeEditingScreen extends ConsumerWidget {
  const CodeEditingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    @override
    var code = '''main() {
  print("Hello, World!");
  print("Hello, World!");

  print("Hello, World!");

  print("Hello, World!");

  print("Hello, World!");

  print("Hello, World!");

}
''';
    return Scaffold(
        body: Center(
      child: HighlightView(code,
          language: 'dart',
          theme: githubTheme,
          padding: const EdgeInsets.all(12),
          textStyle: GoogleFonts.firaCode(fontSize: 16)),
    ));
  }
}

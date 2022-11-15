import 'package:codeblurb/presentation/features/code_editing/notifier/code_editing_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

part 'components/character_insertion_button.dart';
part 'components/character_insertion_button_row.dart';
part 'components/code_editing_screen_wrapper.dart';

class CodeEditingScreen extends ConsumerWidget {
  const CodeEditingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(codeEditingProvider.notifier);
    final state = ref.watch(codeEditingProvider);

    return _CodeEditingScreenWrapper(
      children: [
        HighlightView(
          state.code,
          language: 'dart',
          theme: githubTheme,
          padding: const EdgeInsets.all(12),
          textStyle: GoogleFonts.firaCode(fontSize: 16),
        ),
        TextField(
          keyboardType: TextInputType.multiline,
          minLines: null,
          maxLines: null,
          enableSuggestions: false,
          autocorrect: false,
          controller: notifier.codeEditingController,
          onChanged: notifier.setCode,
        ),
        const Spacer(),
        ElevatedButton(onPressed: notifier.onPress, child: const Text('echo')),
        const Spacer(),
        const _CharacterInsertionButtonRow(),
      ],
    );
  }
}

import 'package:codeblurb/presentation/features/code_editing/notifier/code_editing_notifier_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';

part 'components/character_insertion_button.dart';
part 'components/character_insertion_button_row.dart';
part 'components/code_editing_screen_wrapper.dart';

class CodeEditingScreen extends ConsumerWidget {
  const CodeEditingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(codeEditingNotifierProvider.notifier);
    final state = ref.watch(codeEditingNotifierProvider);
    final mediaQuery = MediaQuery.of(context);

    return _CodeEditingScreenWrapper(
      children: [
        SizedBox(
          height: mediaQuery.size.height / 2,
          child: SyntaxView(
            code: state.code,
            syntax: Syntax.DART,
            syntaxTheme: SyntaxTheme.vscodeDark(),
            fontSize: 14.0,
            withZoom: false,
            withLinesCount: true,
            expanded: true,
          ),
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

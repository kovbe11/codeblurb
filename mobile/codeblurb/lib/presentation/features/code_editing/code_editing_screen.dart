import 'package:codeblurb/presentation/features/code_editing/notifier/code_editing_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'components/character_insertion_button_row.dart';

class CodeEditingScreen extends ConsumerWidget {
  const CodeEditingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(codeEditingProvider.notifier);
    final state = ref.watch(codeEditingProvider);

    return Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
          child: ConstrainedBox(
              constraints: BoxConstraints(
                  minWidth: constraints.maxWidth,
                  minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(mainAxisSize: MainAxisSize.max, children: [
                  TextField(
                    autocorrect: false,
                    controller: notifier.codeEditingController,
                    maxLines: 5,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.green,
                      child: const Text('body'),
                    ),
                  ),
                  const _CharacterInsertionButtonRow(),
                  const Text('footer'),
                ]),
              )));
    })
        // body: SingleChildScrollView(
        //   child: Column(
        //     children: [

        //       TextField(
        //         controller: notifier.codeEditingController,
        //         maxLines: 5,
        //       ),
        //       const Spacer(),
        //       const _CharacterInsertionButtonRow(),
        //     ],
        //   ),
        // ),
        );
  }
}



      //  HighlightView(
      //           state.code,
      //           language: 'dart',
      //           theme: githubTheme,
      //           padding: const EdgeInsets.all(12),
      //           textStyle: GoogleFonts.firaCode(fontSize: 16),
      //         ),
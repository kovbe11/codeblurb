import "package:auto_size_text/auto_size_text.dart";
import 'package:codeblurb/core/app_colors.dart';
import 'package:codeblurb/core/app_ui_constants.dart';
import 'package:codeblurb/presentation/features/code_editing/notifier/code_editing_notifier_provider.dart';
import 'package:codeblurb/presentation/widgets/overlay_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'components/character_insertion_button.dart';
part 'components/character_insertion_button_row.dart';
part 'components/code_editing_screen_wrapper.dart';

class CodeEditingScreen extends ConsumerStatefulWidget {
  const CodeEditingScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();
}

class _State extends ConsumerState<CodeEditingScreen> {
  late final FocusNode node;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    node = FocusNode();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    DefaultTabController.of(context)?.addListener(() {
      final index = DefaultTabController.of(context)?.index ?? 0;
      if (index == 1) {
        _focusField();
      } else {
        _unfocus();
      }
    });
  }

  void _focusField() {
    node.requestFocus();
    setState(() {
      _isFocused = true;
    });
  }

  void _unfocus() {
    FocusManager.instance.primaryFocus?.unfocus();
    setState(() {
      _isFocused = false;
    });
  }

  void _runCode() async {
    _unfocus();
    OverlayLoader.show(context);
    await Future.delayed(const Duration(seconds: 1));
    OverlayLoader.hide();
    // ignore: use_build_context_synchronously
    DefaultTabController.of(context)?.animateTo(2);
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.watch(codeEditingNotifierProvider.notifier);

    return _CodeEditingScreenWrapper(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              focusNode: node,
              keyboardType: TextInputType.multiline,
              minLines: null,
              maxLines: null,
              enableSuggestions: false,
              decoration: null,
              cursorColor: AppColors.baseBlue,
              autocorrect: false,
              controller: notifier.codeEditingController,
              onChanged: notifier.setCode,
            ),
          ),
        ),
        if (_isFocused)
          _CharacterInsertionButtonRow(
            onUnfocus: _unfocus,
            onRunCode: _runCode,
          ),
      ],
    );
  }

  @override
  void dispose() {
    _unfocus();
    node.dispose();
    super.dispose();
  }
}

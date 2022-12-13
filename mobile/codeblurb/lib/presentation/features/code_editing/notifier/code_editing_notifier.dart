import 'package:codeblurb/data/shopping/shopping_repository.dart';
import 'package:codeblurb/presentation/features/code_editing/notifier/code_editing_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CodeEditingNotifier extends StateNotifier<CodeEditingState> {
  CodeEditingNotifier(String starterCode, this._read)
      : super(CodeEditingState(code: starterCode));

  late final codeEditingController = TextEditingController(text: state.code);

  final Reader _read;

  void setIsFocused(bool value) {
    state = state.copyWith(isFocused: value);
  }

  void setCode(String code) {
    state = state.copyWith(code: code);
  }

  void insertCurlyBraces() => _insertCodeToCurrentPosition(code: '{}');
  void insertParentheses() => _insertCodeToCurrentPosition(code: '()');

  void insertQuotes() => _insertCodeToCurrentPosition(code: '""');

  void insertCode(String code) => _insertCodeToCurrentPosition(code: code);

  void insertSquareBrackets() => _insertCodeToCurrentPosition(code: '[]');

  void insertTab() => _insertCodeToCurrentPosition(code: '\t');

  void insertEqualSign() => _insertCodeToCurrentPosition(
      code: ' = ', cursorOffsetFromInsertionPoint: 3);

  void onPress() async {
    await _read(shoppingRepoProvider).getAvailableShoppingItems();
  }

  void _insertCodeToCurrentPosition(
      {required String code, int cursorOffsetFromInsertionPoint = 1}) {
    final cursorPosition = codeEditingController.selection.extent;
    final currentCode = codeEditingController.text;

    final newCode = currentCode.replaceRange(
        cursorPosition.offset, cursorPosition.offset, code);
    codeEditingController.text = newCode;
    codeEditingController.selection = TextSelection.collapsed(
        offset: cursorPosition.offset + cursorOffsetFromInsertionPoint);

    state = state.copyWith(code: codeEditingController.text);
  }
}

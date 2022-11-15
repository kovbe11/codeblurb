import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'code_editing_notifier.dart';
import 'code_editing_state.dart';

const _dummyCode = '''main() {
  print("Hello, World!");
  print("Hello, World!");

  print("Hello, World!");

  print("Hello, World!");

  print("Hello, World!");

  print("Hello, World!");

}
''';

final codeEditingProvider =
    StateNotifierProvider.autoDispose<CodeEditingNotifier, CodeEditingState>(
  (ref) => CodeEditingNotifier(_dummyCode),
  name: 'Code Editing Notifier',
);

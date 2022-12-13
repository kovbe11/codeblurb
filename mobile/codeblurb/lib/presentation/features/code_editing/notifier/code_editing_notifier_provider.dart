import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'code_editing_notifier.dart';
import 'code_editing_state.dart';

const _dummyCode = '''
// Your First Program

class HelloWorld {
    public static void main(String[] args) {
        //Write your solution here 
    }
}
''';

final codeEditingNotifierProvider =
    StateNotifierProvider.autoDispose<CodeEditingNotifier, CodeEditingState>(
  (ref) => CodeEditingNotifier(_dummyCode, ref.read),
  name: 'Code Editing Notifier',
);

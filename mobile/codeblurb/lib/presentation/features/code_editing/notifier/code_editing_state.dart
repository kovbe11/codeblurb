import 'package:freezed_annotation/freezed_annotation.dart';

part 'code_editing_state.freezed.dart';

@freezed
class CodeEditingState with _$CodeEditingState {
  const factory CodeEditingState({
    @Default("") String code,
    @Default(0) int cursorPosition,
  }) = _CodeEditingState;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'code_editing_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CodeEditingState {
  String get code => throw _privateConstructorUsedError;
  int get cursorPosition => throw _privateConstructorUsedError;
  bool get isFocused => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CodeEditingStateCopyWith<CodeEditingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CodeEditingStateCopyWith<$Res> {
  factory $CodeEditingStateCopyWith(
          CodeEditingState value, $Res Function(CodeEditingState) then) =
      _$CodeEditingStateCopyWithImpl<$Res, CodeEditingState>;
  @useResult
  $Res call({String code, int cursorPosition, bool isFocused});
}

/// @nodoc
class _$CodeEditingStateCopyWithImpl<$Res, $Val extends CodeEditingState>
    implements $CodeEditingStateCopyWith<$Res> {
  _$CodeEditingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? cursorPosition = null,
    Object? isFocused = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      cursorPosition: null == cursorPosition
          ? _value.cursorPosition
          : cursorPosition // ignore: cast_nullable_to_non_nullable
              as int,
      isFocused: null == isFocused
          ? _value.isFocused
          : isFocused // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CodeEditingStateCopyWith<$Res>
    implements $CodeEditingStateCopyWith<$Res> {
  factory _$$_CodeEditingStateCopyWith(
          _$_CodeEditingState value, $Res Function(_$_CodeEditingState) then) =
      __$$_CodeEditingStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, int cursorPosition, bool isFocused});
}

/// @nodoc
class __$$_CodeEditingStateCopyWithImpl<$Res>
    extends _$CodeEditingStateCopyWithImpl<$Res, _$_CodeEditingState>
    implements _$$_CodeEditingStateCopyWith<$Res> {
  __$$_CodeEditingStateCopyWithImpl(
      _$_CodeEditingState _value, $Res Function(_$_CodeEditingState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? cursorPosition = null,
    Object? isFocused = null,
  }) {
    return _then(_$_CodeEditingState(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      cursorPosition: null == cursorPosition
          ? _value.cursorPosition
          : cursorPosition // ignore: cast_nullable_to_non_nullable
              as int,
      isFocused: null == isFocused
          ? _value.isFocused
          : isFocused // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_CodeEditingState implements _CodeEditingState {
  const _$_CodeEditingState(
      {this.code = "", this.cursorPosition = 0, this.isFocused = false});

  @override
  @JsonKey()
  final String code;
  @override
  @JsonKey()
  final int cursorPosition;
  @override
  @JsonKey()
  final bool isFocused;

  @override
  String toString() {
    return 'CodeEditingState(code: $code, cursorPosition: $cursorPosition, isFocused: $isFocused)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CodeEditingState &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.cursorPosition, cursorPosition) ||
                other.cursorPosition == cursorPosition) &&
            (identical(other.isFocused, isFocused) ||
                other.isFocused == isFocused));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, cursorPosition, isFocused);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CodeEditingStateCopyWith<_$_CodeEditingState> get copyWith =>
      __$$_CodeEditingStateCopyWithImpl<_$_CodeEditingState>(this, _$identity);
}

abstract class _CodeEditingState implements CodeEditingState {
  const factory _CodeEditingState(
      {final String code,
      final int cursorPosition,
      final bool isFocused}) = _$_CodeEditingState;

  @override
  String get code;
  @override
  int get cursorPosition;
  @override
  bool get isFocused;
  @override
  @JsonKey(ignore: true)
  _$$_CodeEditingStateCopyWith<_$_CodeEditingState> get copyWith =>
      throw _privateConstructorUsedError;
}

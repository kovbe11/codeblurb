// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
      _$CodeEditingStateCopyWithImpl<$Res>;
  $Res call({String code, int cursorPosition, bool isFocused});
}

/// @nodoc
class _$CodeEditingStateCopyWithImpl<$Res>
    implements $CodeEditingStateCopyWith<$Res> {
  _$CodeEditingStateCopyWithImpl(this._value, this._then);

  final CodeEditingState _value;
  // ignore: unused_field
  final $Res Function(CodeEditingState) _then;

  @override
  $Res call({
    Object? code = freezed,
    Object? cursorPosition = freezed,
    Object? isFocused = freezed,
  }) {
    return _then(_value.copyWith(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      cursorPosition: cursorPosition == freezed
          ? _value.cursorPosition
          : cursorPosition // ignore: cast_nullable_to_non_nullable
              as int,
      isFocused: isFocused == freezed
          ? _value.isFocused
          : isFocused // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_CodeEditingStateCopyWith<$Res>
    implements $CodeEditingStateCopyWith<$Res> {
  factory _$$_CodeEditingStateCopyWith(
          _$_CodeEditingState value, $Res Function(_$_CodeEditingState) then) =
      __$$_CodeEditingStateCopyWithImpl<$Res>;
  @override
  $Res call({String code, int cursorPosition, bool isFocused});
}

/// @nodoc
class __$$_CodeEditingStateCopyWithImpl<$Res>
    extends _$CodeEditingStateCopyWithImpl<$Res>
    implements _$$_CodeEditingStateCopyWith<$Res> {
  __$$_CodeEditingStateCopyWithImpl(
      _$_CodeEditingState _value, $Res Function(_$_CodeEditingState) _then)
      : super(_value, (v) => _then(v as _$_CodeEditingState));

  @override
  _$_CodeEditingState get _value => super._value as _$_CodeEditingState;

  @override
  $Res call({
    Object? code = freezed,
    Object? cursorPosition = freezed,
    Object? isFocused = freezed,
  }) {
    return _then(_$_CodeEditingState(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      cursorPosition: cursorPosition == freezed
          ? _value.cursorPosition
          : cursorPosition // ignore: cast_nullable_to_non_nullable
              as int,
      isFocused: isFocused == freezed
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
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality()
                .equals(other.cursorPosition, cursorPosition) &&
            const DeepCollectionEquality().equals(other.isFocused, isFocused));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(cursorPosition),
      const DeepCollectionEquality().hash(isFocused));

  @JsonKey(ignore: true)
  @override
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

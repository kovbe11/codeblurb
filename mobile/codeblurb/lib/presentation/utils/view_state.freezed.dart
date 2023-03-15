// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ViewState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(T value) data,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(T value)? data,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(T value)? data,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ViewStateIdle<T> value) idle,
    required TResult Function(_ViewStateLoading<T> value) loading,
    required TResult Function(_ViewStateData<T> value) data,
    required TResult Function(_ViewStateError<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ViewStateIdle<T> value)? idle,
    TResult? Function(_ViewStateLoading<T> value)? loading,
    TResult? Function(_ViewStateData<T> value)? data,
    TResult? Function(_ViewStateError<T> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ViewStateIdle<T> value)? idle,
    TResult Function(_ViewStateLoading<T> value)? loading,
    TResult Function(_ViewStateData<T> value)? data,
    TResult Function(_ViewStateError<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewStateCopyWith<T, $Res> {
  factory $ViewStateCopyWith(
          ViewState<T> value, $Res Function(ViewState<T>) then) =
      _$ViewStateCopyWithImpl<T, $Res, ViewState<T>>;
}

/// @nodoc
class _$ViewStateCopyWithImpl<T, $Res, $Val extends ViewState<T>>
    implements $ViewStateCopyWith<T, $Res> {
  _$ViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_ViewStateIdleCopyWith<T, $Res> {
  factory _$$_ViewStateIdleCopyWith(
          _$_ViewStateIdle<T> value, $Res Function(_$_ViewStateIdle<T>) then) =
      __$$_ViewStateIdleCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$_ViewStateIdleCopyWithImpl<T, $Res>
    extends _$ViewStateCopyWithImpl<T, $Res, _$_ViewStateIdle<T>>
    implements _$$_ViewStateIdleCopyWith<T, $Res> {
  __$$_ViewStateIdleCopyWithImpl(
      _$_ViewStateIdle<T> _value, $Res Function(_$_ViewStateIdle<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ViewStateIdle<T> extends _ViewStateIdle<T> {
  const _$_ViewStateIdle() : super._();

  @override
  String toString() {
    return 'ViewState<$T>.idle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ViewStateIdle<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(T value) data,
    required TResult Function(String message) error,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(T value)? data,
    TResult? Function(String message)? error,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(T value)? data,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ViewStateIdle<T> value) idle,
    required TResult Function(_ViewStateLoading<T> value) loading,
    required TResult Function(_ViewStateData<T> value) data,
    required TResult Function(_ViewStateError<T> value) error,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ViewStateIdle<T> value)? idle,
    TResult? Function(_ViewStateLoading<T> value)? loading,
    TResult? Function(_ViewStateData<T> value)? data,
    TResult? Function(_ViewStateError<T> value)? error,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ViewStateIdle<T> value)? idle,
    TResult Function(_ViewStateLoading<T> value)? loading,
    TResult Function(_ViewStateData<T> value)? data,
    TResult Function(_ViewStateError<T> value)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _ViewStateIdle<T> extends ViewState<T> {
  const factory _ViewStateIdle() = _$_ViewStateIdle<T>;
  const _ViewStateIdle._() : super._();
}

/// @nodoc
abstract class _$$_ViewStateLoadingCopyWith<T, $Res> {
  factory _$$_ViewStateLoadingCopyWith(_$_ViewStateLoading<T> value,
          $Res Function(_$_ViewStateLoading<T>) then) =
      __$$_ViewStateLoadingCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$_ViewStateLoadingCopyWithImpl<T, $Res>
    extends _$ViewStateCopyWithImpl<T, $Res, _$_ViewStateLoading<T>>
    implements _$$_ViewStateLoadingCopyWith<T, $Res> {
  __$$_ViewStateLoadingCopyWithImpl(_$_ViewStateLoading<T> _value,
      $Res Function(_$_ViewStateLoading<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ViewStateLoading<T> extends _ViewStateLoading<T> {
  const _$_ViewStateLoading() : super._();

  @override
  String toString() {
    return 'ViewState<$T>.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ViewStateLoading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(T value) data,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(T value)? data,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(T value)? data,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ViewStateIdle<T> value) idle,
    required TResult Function(_ViewStateLoading<T> value) loading,
    required TResult Function(_ViewStateData<T> value) data,
    required TResult Function(_ViewStateError<T> value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ViewStateIdle<T> value)? idle,
    TResult? Function(_ViewStateLoading<T> value)? loading,
    TResult? Function(_ViewStateData<T> value)? data,
    TResult? Function(_ViewStateError<T> value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ViewStateIdle<T> value)? idle,
    TResult Function(_ViewStateLoading<T> value)? loading,
    TResult Function(_ViewStateData<T> value)? data,
    TResult Function(_ViewStateError<T> value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _ViewStateLoading<T> extends ViewState<T> {
  const factory _ViewStateLoading() = _$_ViewStateLoading<T>;
  const _ViewStateLoading._() : super._();
}

/// @nodoc
abstract class _$$_ViewStateDataCopyWith<T, $Res> {
  factory _$$_ViewStateDataCopyWith(
          _$_ViewStateData<T> value, $Res Function(_$_ViewStateData<T>) then) =
      __$$_ViewStateDataCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T value});
}

/// @nodoc
class __$$_ViewStateDataCopyWithImpl<T, $Res>
    extends _$ViewStateCopyWithImpl<T, $Res, _$_ViewStateData<T>>
    implements _$$_ViewStateDataCopyWith<T, $Res> {
  __$$_ViewStateDataCopyWithImpl(
      _$_ViewStateData<T> _value, $Res Function(_$_ViewStateData<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$_ViewStateData<T>(
      freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$_ViewStateData<T> extends _ViewStateData<T> {
  const _$_ViewStateData(this.value) : super._();

  @override
  final T value;

  @override
  String toString() {
    return 'ViewState<$T>.data(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ViewStateData<T> &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ViewStateDataCopyWith<T, _$_ViewStateData<T>> get copyWith =>
      __$$_ViewStateDataCopyWithImpl<T, _$_ViewStateData<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(T value) data,
    required TResult Function(String message) error,
  }) {
    return data(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(T value)? data,
    TResult? Function(String message)? error,
  }) {
    return data?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(T value)? data,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ViewStateIdle<T> value) idle,
    required TResult Function(_ViewStateLoading<T> value) loading,
    required TResult Function(_ViewStateData<T> value) data,
    required TResult Function(_ViewStateError<T> value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ViewStateIdle<T> value)? idle,
    TResult? Function(_ViewStateLoading<T> value)? loading,
    TResult? Function(_ViewStateData<T> value)? data,
    TResult? Function(_ViewStateError<T> value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ViewStateIdle<T> value)? idle,
    TResult Function(_ViewStateLoading<T> value)? loading,
    TResult Function(_ViewStateData<T> value)? data,
    TResult Function(_ViewStateError<T> value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class _ViewStateData<T> extends ViewState<T> {
  const factory _ViewStateData(final T value) = _$_ViewStateData<T>;
  const _ViewStateData._() : super._();

  T get value;
  @JsonKey(ignore: true)
  _$$_ViewStateDataCopyWith<T, _$_ViewStateData<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ViewStateErrorCopyWith<T, $Res> {
  factory _$$_ViewStateErrorCopyWith(_$_ViewStateError<T> value,
          $Res Function(_$_ViewStateError<T>) then) =
      __$$_ViewStateErrorCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_ViewStateErrorCopyWithImpl<T, $Res>
    extends _$ViewStateCopyWithImpl<T, $Res, _$_ViewStateError<T>>
    implements _$$_ViewStateErrorCopyWith<T, $Res> {
  __$$_ViewStateErrorCopyWithImpl(
      _$_ViewStateError<T> _value, $Res Function(_$_ViewStateError<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_ViewStateError<T>(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ViewStateError<T> extends _ViewStateError<T> {
  const _$_ViewStateError(this.message) : super._();

  @override
  final String message;

  @override
  String toString() {
    return 'ViewState<$T>.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ViewStateError<T> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ViewStateErrorCopyWith<T, _$_ViewStateError<T>> get copyWith =>
      __$$_ViewStateErrorCopyWithImpl<T, _$_ViewStateError<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(T value) data,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(T value)? data,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(T value)? data,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ViewStateIdle<T> value) idle,
    required TResult Function(_ViewStateLoading<T> value) loading,
    required TResult Function(_ViewStateData<T> value) data,
    required TResult Function(_ViewStateError<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ViewStateIdle<T> value)? idle,
    TResult? Function(_ViewStateLoading<T> value)? loading,
    TResult? Function(_ViewStateData<T> value)? data,
    TResult? Function(_ViewStateError<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ViewStateIdle<T> value)? idle,
    TResult Function(_ViewStateLoading<T> value)? loading,
    TResult Function(_ViewStateData<T> value)? data,
    TResult Function(_ViewStateError<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ViewStateError<T> extends ViewState<T> {
  const factory _ViewStateError(final String message) = _$_ViewStateError<T>;
  const _ViewStateError._() : super._();

  String get message;
  @JsonKey(ignore: true)
  _$$_ViewStateErrorCopyWith<T, _$_ViewStateError<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

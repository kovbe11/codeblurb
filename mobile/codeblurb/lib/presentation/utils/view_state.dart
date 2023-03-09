import 'package:freezed_annotation/freezed_annotation.dart';

part 'view_state.freezed.dart';

@freezed
class ViewState<T> with _$ViewState<T> {
  const factory ViewState.idle() = _ViewStateIdle<T>;
  const factory ViewState.loading() = _ViewStateLoading<T>;
  const factory ViewState.data(T value) = _ViewStateData<T>;
  const factory ViewState.error(String message) = _ViewStateError<T>;

  const ViewState._();

  bool get isLoading => maybeWhen(loading: () => true, orElse: () => false);
  bool get isError => maybeWhen(error: (_) => true, orElse: () => false);
  T? get value => whenOrNull(data: (value) => value);
}

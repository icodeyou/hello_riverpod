/*import 'package:freezed_annotation/freezed_annotation.dart';

part '../../presentation/states/home_state.freezed.dart';

@freezed
class AppState<T> with _$AppState {
  const AppState._();

  const factory AppState.init() = _Init;

  const factory AppState.loading() = _Loading;

  const factory AppState.success(T data) = _Success;

  const factory AppState.error(Exception exception) = _Error;

  bool get isLoading => maybeWhen(loading: () => true, orElse: () => false);

  bool get isSuccess =>
      maybeMap(success: (_) => true, orElse: () => false);
}
*/
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/weather.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const HomeState._();

  const factory HomeState.init() = _Init;

  const factory HomeState.loading() = _Loading;

  const factory HomeState.success(Weather weather) = _Success;

  const factory HomeState.error(Exception exception) = _Error;

  bool get isLoading => maybeWhen(loading: () => true, orElse: () => false);

  bool get isWeatherLoaded =>
      maybeMap(success: (_) => true, orElse: () => false);

  Weather? get weather =>
      maybeWhen(success: (weather) => weather, orElse: () => null);
}

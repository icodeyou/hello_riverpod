import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/model/weather.dart';
import '../../domain/usecase/get_current_weather_use_case.dart';
import '../states/home_state.dart';

class HomeController extends StateNotifier<HomeState> {
  final GetWeatherUseCase _getCurrentWeatherUseCase;

  HomeController({required GetWeatherUseCase getCurrentWeatherUseCase})
      : _getCurrentWeatherUseCase = getCurrentWeatherUseCase,
        super(const HomeState.init()) {
    getWeather();
  }

  Future<void> getWeather() async {
    state = const HomeState.loading();
    try {
      Weather weather = await _getCurrentWeatherUseCase.execute();
      state = HomeState.success(weather);
    } on Exception catch (e) {
      state = HomeState.error(e);
    }
  }
}

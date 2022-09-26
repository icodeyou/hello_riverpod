import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/data_module.dart';
import 'usecase/get_current_weather_use_case.dart';

final getWeatherUseCaseProvider = Provider.autoDispose((ref) {
  return GetWeatherUseCase(ref.watch(weatherRepositoryProvider));
});

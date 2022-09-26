import '../model/weather.dart';
import '../repository/weather_repository.dart';

class GetWeatherUseCase {
  final WeatherRepository _weatherRepository;

  GetWeatherUseCase(WeatherRepository wr) : _weatherRepository = wr;

  Future<Weather> execute() {
    return _weatherRepository.getWeather();
  }
}

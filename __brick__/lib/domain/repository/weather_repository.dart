import '../model/weather.dart';

abstract class WeatherRepository {
  Future<Weather> getWeather();
}

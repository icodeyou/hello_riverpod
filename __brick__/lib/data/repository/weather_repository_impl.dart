import '../../domain/model/weather.dart';
import '../../domain/repository/weather_repository.dart';
import '../entity/weather_response.dart';
import '../mapper/weather_mapper.dart';
import '../service/weather_api.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherApi _weatherApi;
  WeatherRepositoryImpl(WeatherApi weatherApi) : _weatherApi = weatherApi;

  @override
  Future<Weather> getWeather() async {
    WeatherResponse dataModel = await _weatherApi.getWeather();
    return WeatherMapper.dataToDomain(dataModel);
  }
}

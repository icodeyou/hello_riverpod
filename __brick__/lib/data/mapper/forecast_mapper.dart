import '../../domain/model/city.dart';
import '../../domain/model/day.dart';
import '../../domain/model/weather.dart';
import '../../presentation/ui/utils/extensions.dart';
import '../entity/forecast_day_entity.dart';
import '../entity/forecast_response.dart';

class ForecastMapper {
  static Map<Day, Weather> dataToDomain(
      ForecastResponse forecastResponse, City city) {
    Map<Day, Weather> map = {};

    // Only keep one data per day, making sure it starts by tomorrow
    // This basic code be improved by only taking timestamp for a specific time (ex: noon)
    for (int i = 7; i < 40; i = i + 8) {
      map.putIfAbsent(Day(timestampSeconds: forecastResponse.list[i].dt),
          () => forecastDayEntityToWeather(forecastResponse.list[i], city));
    }

    return map;
  }

  static Weather forecastDayEntityToWeather(
      ForecastDayEntity forecastDayEntity, City city) {
    return Weather(
        title: forecastDayEntity.weather.first.main,
        description: forecastDayEntity.weather.first.description.capitalize,
        city: city,
        tempCelsius: forecastDayEntity.main.temp.kelvinToCelsius,
        tempMinCelsius: forecastDayEntity.main.temp_min.kelvinToCelsius,
        tempMaxCelsius: forecastDayEntity.main.temp_max.kelvinToCelsius,
        humidity: forecastDayEntity.main.humidity,
        gust: forecastDayEntity.wind.gust ?? 0);
  }
}

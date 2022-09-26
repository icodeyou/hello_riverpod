import '../../domain/model/weather.dart';
import '../../presentation/ui/utils/extensions.dart';
import '../entity/weather_response.dart';

class WeatherMapper {
  static Weather dataToDomain(WeatherResponse weatherResponse) {
    return Weather(
      city: weatherResponse.name,
      tempCelsius: weatherResponse.main.temp.kelvinToCelsius,
    );
  }
}

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import '../../presentation/ui/utils/print.dart';
import '../entity/weather_response.dart';

class WeatherRequestFailure implements Exception {}

const apiKey = 'e867aaf3de9fc960cb64326319ab39ad';

class WeatherApi {
  static const _baseUrl = 'api.openweathermap.org';
  final Client _httpClient;

  WeatherApi({Client? httpClient}) : _httpClient = httpClient ?? Client();

  Future<WeatherResponse> getWeather() async {
    Map<String, String> queryParameters = {
      'lat': '48.85',
      'lon': '2.35',
      'appId': apiKey
    };
    Uri request = Uri.https(_baseUrl, '/data/2.5/weather', queryParameters);

    if (kDebugMode) {
      Print.info('GET REQUEST : $request');
    }

    Response response = await _httpClient.get(request);

    if (response.statusCode != 200) {
      throw WeatherRequestFailure();
    }

    return WeatherResponse.fromJson(jsonDecode(response.body));
  }
}

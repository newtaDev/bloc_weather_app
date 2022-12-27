import 'package:bloc_weather_app/data/models/request/weather_forcast_req.dart';
import 'package:bloc_weather_app/shared/global/global_keys.dart';
import 'package:dio/dio.dart';

import '../../../shared/helpers/network/dio_client.dart';

class WeatherRemoteDataSource {
  final client = DioClient.getClient();

  Future<Response> getWeatherDetails(WeatherForcastReq req) {
    return client.get(
      '/data/2.5/weather',
      queryParameters: {
        'q': req.city,
        'appid': GlobalKeys.openWeatherApiKey,
        'units': 'metric'
      },
    );
  }
}

import 'package:bloc_weather_app/data/models/request/weather_forcast_req.dart';
import 'package:bloc_weather_app/data/models/response/weather_forcast_res/weather_forcast_res.dart';

abstract class WeatherRepository {
  Future<WeatherForcastRes> getWeatherDetails(WeatherForcastReq req);
}

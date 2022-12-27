import 'package:bloc_weather_app/data/data_source/remote/weather_rds.dart';
import 'package:bloc_weather_app/data/models/request/weather_forcast_req.dart';
import 'package:bloc_weather_app/data/models/response/weather_forcast_res/weather_forcast_res.dart';
import 'package:bloc_weather_app/domain/repositories/weather_repo.dart';
import 'package:dio/dio.dart';

import '../../shared/errors/api_errors.dart';

class WeatherRepoImpl implements WeatherRepository {
  final WeatherRemoteDataSource weatherRds;
  WeatherRepoImpl({required this.weatherRds});

  @override
  Future<WeatherForcastRes> getWeatherDetails(WeatherForcastReq req) async {
    try {
      final res = await weatherRds.getWeatherDetails(req);
      return WeatherForcastRes.fromMap(res.data);
    } on DioError catch (e) {
      if (e.type != DioErrorType.response) rethrow;
      final errorRes = ApiErrorRes.fromMap(e.response?.data);
      throw errorRes;
    } catch (e) {
      rethrow;
    }
  }
}

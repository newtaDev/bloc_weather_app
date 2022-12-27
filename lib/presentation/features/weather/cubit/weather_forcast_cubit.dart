import 'package:bloc_weather_app/data/models/request/weather_forcast_req.dart';
import 'package:equatable/equatable.dart';

import 'package:bloc_weather_app/data/models/response/weather_forcast_res/weather_forcast_res.dart';
import 'package:bloc_weather_app/domain/repositories/weather_repo.dart';
import 'package:bloc_weather_app/shared/errors/api_errors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'weather_forcast_state.dart';

class WeatherForcastCubit extends Cubit<WeatherForcastState> {
  final WeatherRepository weatherRepository;
  WeatherForcastCubit(
    this.weatherRepository,
  ) : super(const WeatherForcastState.init());

  Future<void> getWeatherDeatils(String city) async {
    emit(state.copyWith(status: WeatherForcastStatus.loading));
    try {
      final res = await weatherRepository
          .getWeatherDetails(WeatherForcastReq(city: city));
      emit(
        state.copyWith(status: WeatherForcastStatus.success, weather: res),
      );
    } on ApiErrorRes catch (apiError) {
      emit(
        state.copyWith(
          status: WeatherForcastStatus.error,
          error: apiError,
        ),
      );
    } catch (e) {
      final apiErrorRes = ApiErrorRes(message: 'Unkown weather details');
      emit(
        state.copyWith(
          status: WeatherForcastStatus.error,
          error: apiErrorRes,
        ),
      );
      rethrow;
    }
  }
}

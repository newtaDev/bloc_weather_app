part of 'weather_forcast_cubit.dart';

enum WeatherForcastStatus { initial, loading, success, error }

extension WeatherForcastStatusX on WeatherForcastStatus {
  bool get isInitial => this == WeatherForcastStatus.initial;
  bool get isSuccess => this == WeatherForcastStatus.success;
  bool get isError => this == WeatherForcastStatus.error;
  bool get isLoading => this == WeatherForcastStatus.loading;
}

class WeatherForcastState extends Equatable {
  final WeatherForcastRes? weather;
  final WeatherForcastStatus status;
  final ApiErrorRes? error;
  const WeatherForcastState(
    this.weather,
    this.status,
    this.error,
  );

  const WeatherForcastState.init()
      : weather = null,
        error = null,
        status = WeatherForcastStatus.initial;

  @override
  List<Object?> get props => [weather, status, error];

  WeatherForcastState copyWith({
    WeatherForcastRes? weather,
    WeatherForcastStatus? status,
    ApiErrorRes? error,
  }) {
    return WeatherForcastState(
      weather ?? this.weather,
      status ?? this.status,
      error ?? this.error,
    );
  }
}

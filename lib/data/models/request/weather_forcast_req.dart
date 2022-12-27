import 'package:equatable/equatable.dart';

class WeatherForcastReq extends Equatable {
  final String city;
  const WeatherForcastReq({
    required this.city,
  });

  WeatherForcastReq copyWith({
    String? city,
  }) {
    return WeatherForcastReq(
      city: city ?? this.city,
    );
  }

  @override
  List<Object> get props => [city];
}

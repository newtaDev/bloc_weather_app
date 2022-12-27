import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'clouds.dart';
import 'coord.dart';
import 'main.dart';
import 'sys.dart';
import 'weather.dart';
import 'wind.dart';

class WeatherForcastRes extends Equatable {
  final Coord? coord;
  final List<Weather>? weather;
  final String? base;
  final Main? main;
  final int? visibility;
  final Wind? wind;
  final Clouds? clouds;
  final int? dt;
  final Sys? sys;
  final int? timezone;
  final int? id;
  final String? name;
  final int? cod;

  const WeatherForcastRes({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  });

  factory WeatherForcastRes.fromMap(Map<String, dynamic> data) {
    return WeatherForcastRes(
      coord: data['coord'] == null
          ? null
          : Coord.fromMap(data['coord'] as Map<String, dynamic>),
      weather: (data['weather'] as List<dynamic>?)
          ?.map((e) => Weather.fromMap(e as Map<String, dynamic>))
          .toList(),
      base: data['base'] as String?,
      main: data['main'] == null
          ? null
          : Main.fromMap(data['main'] as Map<String, dynamic>),
      visibility: data['visibility'] as int?,
      wind: data['wind'] == null
          ? null
          : Wind.fromMap(data['wind'] as Map<String, dynamic>),
      clouds: data['clouds'] == null
          ? null
          : Clouds.fromMap(data['clouds'] as Map<String, dynamic>),
      dt: data['dt'] as int?,
      sys: data['sys'] == null
          ? null
          : Sys.fromMap(data['sys'] as Map<String, dynamic>),
      timezone: data['timezone'] as int?,
      id: data['id'] as int?,
      name: data['name'] as String?,
      cod: data['cod'] as int?,
    );
  }

  Map<String, dynamic> toMap() => {
        'coord': coord?.toMap(),
        'weather': weather?.map((e) => e.toMap()).toList(),
        'base': base,
        'main': main?.toMap(),
        'visibility': visibility,
        'wind': wind?.toMap(),
        'clouds': clouds?.toMap(),
        'dt': dt,
        'sys': sys?.toMap(),
        'timezone': timezone,
        'id': id,
        'name': name,
        'cod': cod,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [WeatherForcastRes].
  factory WeatherForcastRes.fromJson(String data) {
    return WeatherForcastRes.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [WeatherForcastRes] to a JSON string.
  String toJson() => json.encode(toMap());

  WeatherForcastRes copyWith({
    Coord? coord,
    List<Weather>? weather,
    String? base,
    Main? main,
    int? visibility,
    Wind? wind,
    Clouds? clouds,
    int? dt,
    Sys? sys,
    int? timezone,
    int? id,
    String? name,
    int? cod,
  }) {
    return WeatherForcastRes(
      coord: coord ?? this.coord,
      weather: weather ?? this.weather,
      base: base ?? this.base,
      main: main ?? this.main,
      visibility: visibility ?? this.visibility,
      wind: wind ?? this.wind,
      clouds: clouds ?? this.clouds,
      dt: dt ?? this.dt,
      sys: sys ?? this.sys,
      timezone: timezone ?? this.timezone,
      id: id ?? this.id,
      name: name ?? this.name,
      cod: cod ?? this.cod,
    );
  }

  @override
  List<Object?> get props {
    return [
      coord,
      weather,
      base,
      main,
      visibility,
      wind,
      clouds,
      dt,
      sys,
      timezone,
      id,
      name,
      cod,
    ];
  }
}

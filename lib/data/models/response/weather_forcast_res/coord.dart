import 'dart:convert';

import 'package:equatable/equatable.dart';

class Coord extends Equatable {
  final double? lon;
  final double? lat;

  const Coord({this.lon, this.lat});

  factory Coord.fromMap(Map<String, dynamic> data) => Coord(
        lon: (data['lon'] as num?)?.toDouble(),
        lat: (data['lat'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        'lon': lon,
        'lat': lat,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Coord].
  factory Coord.fromJson(String data) {
    return Coord.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Coord] to a JSON string.
  String toJson() => json.encode(toMap());

  Coord copyWith({
    double? lon,
    double? lat,
  }) {
    return Coord(
      lon: lon ?? this.lon,
      lat: lat ?? this.lat,
    );
  }

  @override
  List<Object?> get props => [lon, lat];
}

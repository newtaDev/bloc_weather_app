import 'dart:convert';

import 'package:equatable/equatable.dart';

class Sys extends Equatable {
  final int? type;
  final int? id;
  final String? country;
  final int? sunrise;
  final int? sunset;

  const Sys({this.type, this.id, this.country, this.sunrise, this.sunset});

  factory Sys.fromMap(Map<String, dynamic> data) => Sys(
        type: data['type'] as int?,
        id: data['id'] as int?,
        country: data['country'] as String?,
        sunrise: data['sunrise'] as int?,
        sunset: data['sunset'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'type': type,
        'id': id,
        'country': country,
        'sunrise': sunrise,
        'sunset': sunset,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Sys].
  factory Sys.fromJson(String data) {
    return Sys.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Sys] to a JSON string.
  String toJson() => json.encode(toMap());

  Sys copyWith({
    int? type,
    int? id,
    String? country,
    int? sunrise,
    int? sunset,
  }) {
    return Sys(
      type: type ?? this.type,
      id: id ?? this.id,
      country: country ?? this.country,
      sunrise: sunrise ?? this.sunrise,
      sunset: sunset ?? this.sunset,
    );
  }

  @override
  List<Object?> get props => [type, id, country, sunrise, sunset];
}

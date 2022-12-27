import 'dart:convert';

import 'package:equatable/equatable.dart';

class Wind extends Equatable {
  final double? speed;
  final int? deg;

  const Wind({this.speed, this.deg});

  factory Wind.fromMap(Map<String, dynamic> data) => Wind(
        speed: (data['speed'] as num?)?.toDouble(),
        deg: data['deg'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'speed': speed,
        'deg': deg,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Wind].
  factory Wind.fromJson(String data) {
    return Wind.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Wind] to a JSON string.
  String toJson() => json.encode(toMap());

  Wind copyWith({
    double? speed,
    int? deg,
  }) {
    return Wind(
      speed: speed ?? this.speed,
      deg: deg ?? this.deg,
    );
  }

  @override
  List<Object?> get props => [speed, deg];
}

import 'dart:convert';

import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  const Weather({this.id, this.main, this.description, this.icon});

  factory Weather.fromMap(Map<String, dynamic> data) => Weather(
        id: data['id'] as int?,
        main: data['main'] as String?,
        description: data['description'] as String?,
        icon: data['icon'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'main': main,
        'description': description,
        'icon': icon,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Weather].
  factory Weather.fromJson(String data) {
    return Weather.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Weather] to a JSON string.
  String toJson() => json.encode(toMap());

  Weather copyWith({
    int? id,
    String? main,
    String? description,
    String? icon,
  }) {
    return Weather(
      id: id ?? this.id,
      main: main ?? this.main,
      description: description ?? this.description,
      icon: icon ?? this.icon,
    );
  }

  @override
  List<Object?> get props => [id, main, description, icon];
}

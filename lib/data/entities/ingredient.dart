// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Ingredient extends Equatable {
  final String name;
  final String volume;
  final String unit;

  const Ingredient({
    required this.name,
    required this.volume,
    required this.unit,
  });

  Ingredient copyWith({
    String? name,
    String? volume,
    String? unit,
  }) {
    return Ingredient(
      name: name ?? this.name,
      volume: volume ?? this.volume,
      unit: unit ?? this.unit,
    );
  }

  @override
  List<Object> get props => [name, volume, unit];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'volume': volume,
      'unit': unit,
    };
  }

  factory Ingredient.fromMap(Map<String, dynamic> map) {
    return Ingredient(
      name: map['name'] as String,
      volume: map['volume'] as String,
      unit: map['unit'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Ingredient.fromJson(String source) =>
      Ingredient.fromMap(json.decode(source) as Map<String, dynamic>);
}

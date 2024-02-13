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
}

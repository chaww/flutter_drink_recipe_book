import 'package:equatable/equatable.dart';

class Ingredient extends Equatable {
  final String name;
  final String value;
  final String unit;

  const Ingredient({
    required this.name,
    required this.value,
    required this.unit,
  });

  Ingredient copyWith({
    String? name,
    String? value,
    String? unit,
  }) {
    return Ingredient(
      name: name ?? this.name,
      value: value ?? this.value,
      unit: unit ?? this.unit,
    );
  }

  @override
  List<Object> get props => [name, value, unit];
}

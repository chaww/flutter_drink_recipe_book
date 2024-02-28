import 'package:equatable/equatable.dart';

class AppSettings extends Equatable {
  final String theme;
  final String locale;

  const AppSettings({
    required this.theme,
    required this.locale,
  });

  AppSettings copyWith({
    String? theme,
    String? locale,
  }) {
    return AppSettings(
      theme: theme ?? this.theme,
      locale: locale ?? this.locale,
    );
  }

  @override
  List<Object> get props => [theme, locale];
}

part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  final AppTheme theme;
  final String locale;

  const SettingsState({
    required this.theme,
    required this.locale,
  });

  SettingsState copyWith({
    AppTheme? theme,
    String? locale,
  }) {
    return SettingsState(
      theme: theme ?? this.theme,
      locale: locale ?? this.locale,
    );
  }

  @override
  List<Object> get props => [theme, locale];
}

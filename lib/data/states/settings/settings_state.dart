part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  final AppTheme theme;
  final String locale;

  const SettingsState({
    this.theme = const LightAppTheme(),
    this.locale = 'en',
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

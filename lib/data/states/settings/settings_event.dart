part of 'settings_bloc.dart';

class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class SettingsThemeChanged extends SettingsEvent {
  final AppTheme theme;

  const SettingsThemeChanged({
    required this.theme,
  });

  @override
  List<Object> get props => [theme];
}

class SettingsLocaleChanged extends SettingsEvent {
  final String locale;
  const SettingsLocaleChanged({
    required this.locale,
  });

  @override
  List<Object> get props => [locale];
}

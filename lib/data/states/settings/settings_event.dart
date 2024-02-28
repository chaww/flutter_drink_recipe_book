part of 'settings_bloc.dart';

class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class SettingsThemeSwitch extends SettingsEvent {
  const SettingsThemeSwitch();
}

class SettingsLocaleSwitch extends SettingsEvent {
  const SettingsLocaleSwitch();
}

class SettingsInitialState extends SettingsEvent {
  const SettingsInitialState();
}

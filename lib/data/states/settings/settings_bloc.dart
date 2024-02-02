import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_drink_recipe_book/data/states/settings/settings_event.dart';
import 'package:flutter_drink_recipe_book/data/states/settings/settings_state.dart';

@singleton
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const SettingsState()) {
    on<SettingsThemeChanged>(_onThemeChanged);
    on<SettingsLocaleChanged>(_onLocaleChanged);
  }

  void _onThemeChanged(
      SettingsThemeChanged event, Emitter<SettingsState> emit) async {
    emit(state.copyWith(theme: event.theme));
  }

  void _onLocaleChanged(
      SettingsLocaleChanged event, Emitter<SettingsState> emit) async {
    emit(state.copyWith(locale: event.locale));
  }
}

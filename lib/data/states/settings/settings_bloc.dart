import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_drink_recipe_book/data/entities/app_settings.dart';
import 'package:flutter_drink_recipe_book/data/repositories/app_settings_repository.dart';
import 'package:flutter_drink_recipe_book/presenter/themes/themes.dart';
import 'package:flutter_drink_recipe_book/presenter/themes/themes/themes.dark.dart';
import 'package:flutter_drink_recipe_book/presenter/themes/themes/themes.light.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final AppSettinsRepository _appSettinsRepository;

  SettingsBloc({
    required AppSettinsRepository appSettinsRepository,
  })  : _appSettinsRepository = appSettinsRepository,
        super(const SettingsState()) {
    on<SettingsThemeSwitch>(_onThemeSwitch);
    on<SettingsLocaleSwitch>(_onLocaleSwitch);
    on<SettingsInitial>(_onSettingsInitial);
  }

  Future<void> _onSettingsInitial(
    SettingsInitial event,
    Emitter<SettingsState> emit,
  ) async {
    final appSettings = await _appSettinsRepository.getAppSettings();
    if (appSettings == null) return;
    late AppTheme theme;
    if (appSettings.theme == 'light') {
      theme = const LightAppTheme();
    } else {
      theme = const DarkAppTheme();
    }
    emit(state.copyWith(
      theme: theme,
      locale: appSettings.locale,
    ));
  }

  void _onThemeSwitch(
    SettingsThemeSwitch event,
    Emitter<SettingsState> emit,
  ) async {
    final currentTheme = state.theme;
    late AppTheme theme;
    if (currentTheme is LightAppTheme) {
      theme = const DarkAppTheme();
    } else {
      theme = const LightAppTheme();
    }
    emit(state.copyWith(theme: theme));
    _saveAppSettings();
  }

  void _onLocaleSwitch(
    SettingsLocaleSwitch event,
    Emitter<SettingsState> emit,
  ) {
    final currentLocale = state.locale;
    emit(
      state.copyWith(locale: currentLocale == 'en' ? 'th' : 'en'),
    );
    _saveAppSettings();
  }

  void _saveAppSettings() {
    _appSettinsRepository.updateAppSettings(
      AppSettings(
        theme: state.theme.name,
        locale: state.locale,
      ),
    );
  }
}

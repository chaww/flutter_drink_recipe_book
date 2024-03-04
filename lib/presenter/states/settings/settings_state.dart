// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  final AppTheme theme;
  final String locale;
  final bool isAuth;
  final bool isEditor;

  const SettingsState({
    required this.theme,
    required this.locale,
    required this.isAuth,
    required this.isEditor,
  });

  SettingsState copyWith({
    AppTheme? theme,
    String? locale,
    bool? isAuth,
    bool? isEditor,
  }) {
    return SettingsState(
      theme: theme ?? this.theme,
      locale: locale ?? this.locale,
      isAuth: isAuth ?? this.isAuth,
      isEditor: isEditor ?? this.isEditor,
    );
  }

  @override
  List<Object> get props => [theme, locale, isAuth, isEditor];
}

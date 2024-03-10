part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  final AppTheme theme;
  final String locale;
  final String email;
  final bool isEditor;
  final bool isReader;

  const SettingsState({
    required this.theme,
    required this.locale,
    required this.email,
    required this.isEditor,
    required this.isReader,
  });

  SettingsState copyWith({
    AppTheme? theme,
    String? locale,
    String? email,
    bool? isEditor,
    bool? isReader,
  }) {
    return SettingsState(
      theme: theme ?? this.theme,
      locale: locale ?? this.locale,
      email: email ?? this.email,
      isEditor: isEditor ?? this.isEditor,
      isReader: isReader ?? this.isReader,
    );
  }

  @override
  List<Object> get props {
    return [
      theme,
      locale,
      email,
      isEditor,
      isReader,
    ];
  }
}

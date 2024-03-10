class UserData {
  final String email;
  final bool isReader;
  final bool isEditor;
  UserData({
    required this.email,
    required this.isReader,
    required this.isEditor,
  });

  static getDafault() => UserData(email: '', isEditor: false, isReader: false);

  UserData copyWith({
    String? email,
    bool? isReader,
    bool? isEditor,
  }) {
    return UserData(
      email: email ?? this.email,
      isReader: isReader ?? this.isReader,
      isEditor: isEditor ?? this.isEditor,
    );
  }
}

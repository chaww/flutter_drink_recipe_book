// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class LoginRemember extends Equatable {
  final String email;
  final String password;

  const LoginRemember({
    required this.email,
    required this.password,
  });

  LoginRemember copyWith({
    String? email,
    String? password,
  }) {
    return LoginRemember(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [email, password];
}

part of 'menu_bloc.dart';

class MenuEvent extends Equatable {
  const MenuEvent();

  @override
  List<Object> get props => [];
}

class SubscriptionMenuList extends MenuEvent {
  const SubscriptionMenuList();
}

class SignIn extends MenuEvent {
  final String email;
  final String password;
  const SignIn({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}

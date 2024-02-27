part of 'menu_bloc.dart';

class MenuState extends Equatable {
  final List<Menu> menuList;

  final bool isSignedIn;

  const MenuState({
    this.menuList = const [],
    this.isSignedIn = false,
  });

  MenuState copyWith({
    List<Menu>? menuList,
    bool? isSignedIn,
  }) {
    return MenuState(
      menuList: menuList ?? this.menuList,
      isSignedIn: isSignedIn ?? this.isSignedIn,
    );
  }

  @override
  List<Object> get props => [menuList, isSignedIn, DateTime.now().microsecond];
}

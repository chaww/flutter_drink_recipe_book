part of 'menu_bloc.dart';

class MenuState extends Equatable {
  final List<Menu> menuList;
  const MenuState({
    this.menuList = const [],
  });

  MenuState copyWith({
    List<Menu>? menuList,
  }) {
    return MenuState(
      menuList: menuList ?? this.menuList,
    );
  }

  @override
  List<Object> get props => [menuList, DateTime.now().microsecond];
}

part of 'menu_bloc.dart';

class MenuState extends Equatable {
  final List<Menu> listMenu;

  const MenuState({
    this.listMenu = const [],
  });

  MenuState copyWith({
    List<Menu>? listMenu,
    bool? isSignedIn,
  }) {
    return MenuState(
      listMenu: listMenu ?? this.listMenu,
    );
  }

  @override
  List<Object> get props => [listMenu, DateTime.now().microsecond];
}

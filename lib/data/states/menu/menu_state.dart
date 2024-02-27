part of 'menu_bloc.dart';

class MenuState extends Equatable {
  final List<Menu> listMenu;

  final bool isSignedIn;

  const MenuState({
    this.listMenu = const [],
    this.isSignedIn = false,
  });

  MenuState copyWith({
    List<Menu>? listMenu,
    bool? isSignedIn,
  }) {
    return MenuState(
      listMenu: listMenu ?? this.listMenu,
      isSignedIn: isSignedIn ?? this.isSignedIn,
    );
  }

  @override
  List<Object> get props => [listMenu, isSignedIn, DateTime.now().microsecond];
}

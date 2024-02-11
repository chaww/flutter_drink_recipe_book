import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_drink_recipe_book/data/entities/menu.dart';
import 'package:flutter_drink_recipe_book/data/repositories/menu_repository.dart';

part 'menu_event.dart';
part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final MenuRepository _menuRepository;

  MenuBloc({
    required MenuRepository menuRepository,
  })  : _menuRepository = menuRepository,
        super(const MenuState()) {
    on<SubscriptionMenuList>(_onSubscriptionMenuList);
  }

  Future<void> _onSubscriptionMenuList(
    SubscriptionMenuList event,
    Emitter<MenuState> emit,
  ) async {
    await emit.forEach(
      _menuRepository.getMenuList(),
      onData: (menuList) {
        return state.copyWith(menuList: menuList);
      },
    );
  }
}

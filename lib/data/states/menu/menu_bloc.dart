import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_drink_recipe_book/data/repositories/menu_repository.dart';
import 'package:flutter_drink_recipe_book/data/states/menu/menu_event.dart';
import 'package:flutter_drink_recipe_book/data/states/menu/menu_state.dart';

@singleton
class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final MenuRepository _menuRepository;

  MenuBloc({
    required MenuRepository menuRepository,
  })  : _menuRepository = menuRepository,
        super(const MenuState()) {
    log('MenuBloc');
    on<SubscriptionMenuList>(_onSubscriptionMenuList);
  }

  Future<void> _onSubscriptionMenuList(
    SubscriptionMenuList event,
    Emitter<MenuState> emit,
  ) async {
    log('_onSubscriptionMenuList');
    await emit.forEach(
      _menuRepository.getMenuList(),
      onData: (menuList) {
        log('$menuList');
        return state.copyWith(menuList: menuList);
      },
    );
  }
}

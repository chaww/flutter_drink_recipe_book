import 'dart:developer';

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
    on<SubscriptionListMenu>(_onSubscriptionListMenu);
  }

  Future<void> _onSubscriptionListMenu(
    SubscriptionListMenu event,
    Emitter<MenuState> emit,
  ) async {
    await emit.forEach(
      _menuRepository.listMenuStream(),
      onData: (listMenu) {
        return state.copyWith(listMenu: listMenu);
      },
    );
  }
}

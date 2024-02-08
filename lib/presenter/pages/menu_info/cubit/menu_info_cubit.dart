import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_drink_recipe_book/data/entities/ingredient.dart';
import 'package:flutter_drink_recipe_book/data/entities/menu.dart';
import 'package:flutter_drink_recipe_book/presenter/pages/menu_info/menu_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_info_state.dart';
part 'menu_info_cubit.freezed.dart';

class MenuInfoCubit extends Cubit<MenuInfoState> {
  MenuInfoCubit({
    required Menu menu,
  }) : super(MenuInfoState(menu: menu));

  void setOptionFocus({required MenuType type, required int value}) {
    switch (type) {
      case MenuType.hot:
        emit(state.copyWith(hotOptionFocus: value));
        break;
      case MenuType.ice:
        emit(state.copyWith(iceOptionFocus: value));
        break;
      case MenuType.frappe:
        emit(state.copyWith(frappeOptionFocus: value));
        break;
      default:
    }
  }

  void setShowEditButton(bool value) {
    emit(state.copyWith(showEditButton: value));
  }

  void deleteMenu() {
    log('deleteMenu');
  }

  void deleteImage() {
    log('deleteImage');
  }

  void saveMenuName({
    required String nameTh,
    required String nameEn,
  }) {
    log('saveMenuName');
    // emit(
    //   state.copyWith(
    //     menu: state.menu.copyWith(
    //       nameTh: nameTh,
    //       nameEn: nameEn,
    //     ),
    //   ),
    // );
  }

  void saveCategory({
    required String category,
  }) {
    log('saveCategory');
  }

  void saveOptionName({
    required MenuType type,
    required int recipeIndex,
    required String optionName,
  }) {
    log('saveOptionName');
  }

  void deleteOption({
    required MenuType type,
    required int recipeIndex,
  }) {
    log('deleteOption');
  }

  void saveIngredient({
    required MenuType type,
    required int recipeIndex,
    required int ingredientIndex,
    required Ingredient ingredient,
  }) {
    log('saveIngredient');
  }

  void deleteIngredient({
    required MenuType type,
    required int recipeIndex,
    required int ingredientIndex,
  }) {
    log('deleteIngredient');
  }
}

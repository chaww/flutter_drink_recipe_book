import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_drink_recipe_book/data/entities/ingredient.dart';
import 'package:flutter_drink_recipe_book/data/entities/menu.dart';
import 'package:flutter_drink_recipe_book/data/entities/recipe.dart';
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

  void updateMenu() {
    log('updateMenu');
  }

  void deleteMenu() {
    log('deleteMenu');
  }

  void updateImage() {
    log('updateImage');
  }

  void deleteImage() {
    log('deleteImage');
  }

  void updateMenuName({
    required String nameTh,
    required String nameEn,
  }) {
    log('updateMenuName');
    emit(
      state.copyWith(
        menu: state.menu.copyWith(
          nameTh: nameTh,
          nameEn: nameEn,
        ),
      ),
    );
  }

  void updateCategory({
    required String category,
  }) {
    log('updateCategory $category');
    emit(
      state.copyWith(
        menu: state.menu.copyWith(
          category: category,
        ),
      ),
    );
  }

  void updateOptionName({
    required MenuType type,
    required int recipeIndex,
    required String optionName,
  }) {
    log('saveOptionName');
    switch (type) {
      case MenuType.hot:
        List<Recipe> updatedRecipes = List.from(state.menu.recipesHot);
        updatedRecipes[recipeIndex] = updatedRecipes[recipeIndex].copyWith(optionName: optionName);
        emit(
          state.copyWith(
            menu: state.menu.copyWith(
              recipesHot: updatedRecipes,
            ),
          ),
        );
        break;
      case MenuType.ice:
        List<Recipe> updatedRecipes = List.from(state.menu.recipesIce);
        updatedRecipes[recipeIndex] = updatedRecipes[recipeIndex].copyWith(optionName: optionName);
        emit(
          state.copyWith(
            menu: state.menu.copyWith(
              recipesIce: updatedRecipes,
            ),
          ),
        );
        break;
      case MenuType.frappe:
        List<Recipe> updatedRecipes = List.from(state.menu.recipesFrappe);
        updatedRecipes[recipeIndex] = updatedRecipes[recipeIndex].copyWith(optionName: optionName);
        emit(
          state.copyWith(
            menu: state.menu.copyWith(
              recipesFrappe: updatedRecipes,
            ),
          ),
        );
        break;
      default:
    }
  }

  void deleteOption({
    required MenuType type,
    required int recipeIndex,
  }) {
    log('deleteOption');
  }

  void updateIngredient({
    required MenuType type,
    required int recipeIndex,
    required int ingredientIndex,
    required Ingredient ingredient,
  }) {
    log('updateIngredient');
  }

  void deleteIngredient({
    required MenuType type,
    required int recipeIndex,
    required int ingredientIndex,
  }) {
    log('deleteIngredient');
  }
}

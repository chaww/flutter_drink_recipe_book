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
    log('updateOptionName');

    final recipesMap = {
      MenuType.hot: state.menu.recipesHot,
      MenuType.ice: state.menu.recipesIce,
      MenuType.frappe: state.menu.recipesFrappe,
    };

    List<Recipe>? recipes = recipesMap[type];
    if (recipes != null) {
      List<Recipe> updatedRecipes = List.from(recipes);
      updatedRecipes[recipeIndex] = updatedRecipes[recipeIndex].copyWith(optionName: optionName);
      emit(state.copyWith(
        menu: state.menu.copyWith(
          recipesHot: type == MenuType.hot ? updatedRecipes : state.menu.recipesHot,
          recipesIce: type == MenuType.ice ? updatedRecipes : state.menu.recipesIce,
          recipesFrappe: type == MenuType.frappe ? updatedRecipes : state.menu.recipesFrappe,
        ),
      ));
    }
  }

  void deleteRecipe({
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

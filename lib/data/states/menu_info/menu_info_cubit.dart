import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_drink_recipe_book/data/entities/ingredient.dart';
import 'package:flutter_drink_recipe_book/data/entities/menu.dart';
import 'package:flutter_drink_recipe_book/data/entities/recipe.dart';
import 'package:flutter_drink_recipe_book/data/repositories/menu_repository.dart';
import 'package:flutter_drink_recipe_book/presenter/pages/menu_info/menu_type.dart';

part 'menu_info_state.dart';

class MenuInfoCubit extends Cubit<MenuInfoState> {
  MenuInfoCubit({
    required Menu menu,
    required MenuRepository menuRepository,
  })  : _menuRepository = menuRepository,
        super(MenuInfoState(menu: menu));

  final MenuRepository _menuRepository;

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

  void updateMenu() async {
    log('updateMenu');
    final newMenu = await _menuRepository.updateMenu(state.menu);
    // emit(state.copyWith(menu: newMenu));
    emit(state.copyWith(
      menu: newMenu,
      showEditButton: false,
    ));
  }

  void deleteMenu() {
    log('deleteMenu');
    _menuRepository.deleteMenu(state.menu.id);
  }

  void updateImage() async {
    log('updateImage');
    final path = await _menuRepository.displayPickImageDialog();
    if (path == null) return;
    emit(state.copyWith(menu: state.menu.copyWith(imageSrc: path[0])));
  }

  void deleteImage() {
    log('deleteImage');
    emit(state.copyWith(menu: state.menu.copyWith(imageSrc: '')));
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
      if (recipeIndex > -1) {
        updatedRecipes[recipeIndex] = updatedRecipes[recipeIndex].copyWith(optionName: optionName);
      } else {
        updatedRecipes.add(Recipe(optionName: optionName, ingredients: []));
      }
      _updateRecipes(type: type, recipes: updatedRecipes);
      if (recipeIndex == -1) {
        setOptionFocus(type: type, value: updatedRecipes.length - 1);
      }
    }
  }

  void deleteRecipe({
    required MenuType type,
    required int recipeIndex,
  }) {
    log('deleteOption');

    final recipesMap = {
      MenuType.hot: state.menu.recipesHot,
      MenuType.ice: state.menu.recipesIce,
      MenuType.frappe: state.menu.recipesFrappe,
    };

    List<Recipe>? recipes = recipesMap[type];
    if (recipes != null) {
      List<Recipe> updatedRecipes = List.from(recipes);
      updatedRecipes.removeAt(recipeIndex);
      if (updatedRecipes.length > 1) {
        setOptionFocus(type: type, value: updatedRecipes.length - 1);
      }
      _updateRecipes(type: type, recipes: updatedRecipes);
    }
  }

  void updateIngredient({
    required MenuType type,
    required int recipeIndex,
    required int ingredientIndex,
    required Ingredient ingredient,
  }) {
    log('updateIngredient');

    final recipesMap = {
      MenuType.hot: state.menu.recipesHot,
      MenuType.ice: state.menu.recipesIce,
      MenuType.frappe: state.menu.recipesFrappe,
    };

    List<Recipe>? recipes = recipesMap[type];
    if (recipes != null) {
      List<Recipe> updatedRecipes = List.from(recipes);
      List<Ingredient> updateIngredients = List.from(updatedRecipes[recipeIndex].ingredients);
      if (ingredientIndex > -1) {
        updateIngredients[ingredientIndex] = updateIngredients[ingredientIndex].copyWith(
          name: ingredient.name,
          unit: ingredient.unit,
          value: ingredient.value,
        );
      } else {
        updateIngredients.add(ingredient);
      }
      updatedRecipes[recipeIndex] = updatedRecipes[recipeIndex].copyWith(
        ingredients: updateIngredients,
      );
      _updateRecipes(type: type, recipes: updatedRecipes);
    }
  }

  void deleteIngredient({
    required MenuType type,
    required int recipeIndex,
    required int ingredientIndex,
  }) {
    log('deleteIngredient');

    final recipesMap = {
      MenuType.hot: state.menu.recipesHot,
      MenuType.ice: state.menu.recipesIce,
      MenuType.frappe: state.menu.recipesFrappe,
    };

    List<Recipe>? recipes = recipesMap[type];
    if (recipes != null) {
      List<Recipe> updatedRecipes = List.from(recipes);
      List<Ingredient> updateIngredients = List.from(updatedRecipes[recipeIndex].ingredients);
      updateIngredients.removeAt(ingredientIndex);
      updatedRecipes[recipeIndex] = updatedRecipes[recipeIndex].copyWith(
        ingredients: updateIngredients,
      );
      _updateRecipes(type: type, recipes: updatedRecipes);
    }
  }

  void _updateRecipes({
    required MenuType type,
    required List<Recipe> recipes,
  }) {
    emit(state.copyWith(
      menu: state.menu.copyWith(
        recipesHot: type == MenuType.hot ? recipes : state.menu.recipesHot,
        recipesIce: type == MenuType.ice ? recipes : state.menu.recipesIce,
        recipesFrappe: type == MenuType.frappe ? recipes : state.menu.recipesFrappe,
      ),
    ));
  }
}

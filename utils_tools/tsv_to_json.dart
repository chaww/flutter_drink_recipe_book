import 'dart:convert';
import 'dart:io';

void main() {
  String tsvRecipe = File('assets/hidden/recipe_data.tsv').readAsStringSync();
  final List<List<String>> recipeCells = tsvRecipe.split('\n').map((e) => e.split('\t')).toList();
  recipeCells.add(List.generate(10, (index) => ''));

  String tsvMenu = File('assets/hidden/menu_data.tsv').readAsStringSync();
  final List<List<String>> menuCells = tsvMenu.split('\n').map((e) => e.split('\t')).toList();

  final List<List<List<String>>> groups = [];
  List<List<String>> group = [];

  for (var index = 0; index < recipeCells.length; index++) {
    group.add(recipeCells[index]);
    if (index + 1 == recipeCells.length) {
      groups.add(group);
      group = [];
    } else {
      if (recipeCells[index + 1][0].isNotEmpty) {
        groups.add(group);
        group = [];
      }
    }
  }
  final menuList = [];
  for (var groupIndex = 0; groupIndex < groups.length; groupIndex++) {
    final group = groups[groupIndex];
    final nameTh = group[0][0];
    final whereMenuData = menuCells.where((e) => e[0] == nameTh);
    if (whereMenuData.isNotEmpty) {
      final menuData = whereMenuData.first;
      Map<String, dynamic> menu = {
        'nameTh': nameTh,
        'nameEn': menuData[1],
        'category': menuData[2],
        'image': menuData[3].replaceAll('\r', ''),
      };
      List<dynamic> getRecipe(cellName) {
        final recipes = [];
        if (group[1][cellName].isNotEmpty) {
          //
          String optionName = '';
          List<Map<String, String>> ingredients = [];
          for (var index = 0; index < group.length; index++) {
            var isOptionName = false;
            if (index == 0) {
              // คือบนสุด
              isOptionName = true;
            } else {
              if (group[1][cellName].isEmpty && group[index + 1][cellName].isEmpty) {
                // เป็นค่าว่าง && ด้านล่างมีข้อมูล
                isOptionName = true;
              }
            }
            if (isOptionName) {
              optionName = group[index][cellName];
            } else {
              if (group[index][cellName].isNotEmpty) {
                ingredients.add({
                  'name': group[index][cellName].replaceAll('\r', ''),
                  'volume': group[index][cellName + 1].replaceAll('\r', ''),
                  'unit': group[index][cellName + 2].replaceAll('\r', ''),
                });
              } else {
                if (group[index - 1][cellName].isNotEmpty) {
                  recipes.add({
                    'optionName': optionName.replaceAll('\r', ''),
                    'ingredients': ingredients,
                  });
                }
                optionName = '';
                ingredients = [];
              }
            }
          }
        }
        return recipes;
      }

      menu['recipesHot'] = getRecipe(1);
      menu['recipesIce'] = getRecipe(4);
      menu['recipesFrappe'] = getRecipe(7);
      menuList.add(menu);
    }
  }
  File jsonFile = File('assets/hidden/menu_data.json');
  jsonFile.writeAsStringSync(jsonEncode(menuList));

  print('menu_data.json is updated !!');
}

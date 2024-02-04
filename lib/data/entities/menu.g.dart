// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MenuImpl _$$MenuImplFromJson(Map<String, dynamic> json) => _$MenuImpl(
      name: json['name'] as String,
      imageSrc: json['imageSrc'] as String,
      category: $enumDecode(_$MenuCategoriesEnumMap, json['category']),
      recipesHot: (json['recipesHot'] as List<dynamic>)
          .map((e) => Recipe.fromJson(e as Map<String, dynamic>))
          .toList(),
      recipesIce: (json['recipesIce'] as List<dynamic>)
          .map((e) => Recipe.fromJson(e as Map<String, dynamic>))
          .toList(),
      recipesFrappe: (json['recipesFrappe'] as List<dynamic>)
          .map((e) => Recipe.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MenuImplToJson(_$MenuImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'imageSrc': instance.imageSrc,
      'category': _$MenuCategoriesEnumMap[instance.category]!,
      'recipesHot': instance.recipesHot,
      'recipesIce': instance.recipesIce,
      'recipesFrappe': instance.recipesFrappe,
    };

const _$MenuCategoriesEnumMap = {
  MenuCategories.tea: 'tea',
  MenuCategories.coffee: 'coffee',
  MenuCategories.smoothies: 'smoothies',
  MenuCategories.soda: 'soda',
  MenuCategories.others: 'others',
};

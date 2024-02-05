// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MenuImpl _$$MenuImplFromJson(Map<String, dynamic> json) => _$MenuImpl(
      id: json['id'] as String,
      nameTh: json['nameTh'] as String,
      nameEn: json['nameEn'] as String,
      imageSrc: json['imageSrc'] as String,
      category: json['category'] as String,
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
      'id': instance.id,
      'nameTh': instance.nameTh,
      'nameEn': instance.nameEn,
      'imageSrc': instance.imageSrc,
      'category': instance.category,
      'recipesHot': instance.recipesHot,
      'recipesIce': instance.recipesIce,
      'recipesFrappe': instance.recipesFrappe,
    };

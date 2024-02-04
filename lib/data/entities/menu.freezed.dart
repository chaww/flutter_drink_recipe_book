// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Menu _$MenuFromJson(Map<String, dynamic> json) {
  return _Menu.fromJson(json);
}

/// @nodoc
mixin _$Menu {
  String get name => throw _privateConstructorUsedError;
  String get imageSrc => throw _privateConstructorUsedError;
  MenuCategories get category => throw _privateConstructorUsedError;
  List<Recipe> get recipesHot => throw _privateConstructorUsedError;
  List<Recipe> get recipesIce => throw _privateConstructorUsedError;
  List<Recipe> get recipesFrappe => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MenuCopyWith<Menu> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuCopyWith<$Res> {
  factory $MenuCopyWith(Menu value, $Res Function(Menu) then) =
      _$MenuCopyWithImpl<$Res, Menu>;
  @useResult
  $Res call(
      {String name,
      String imageSrc,
      MenuCategories category,
      List<Recipe> recipesHot,
      List<Recipe> recipesIce,
      List<Recipe> recipesFrappe});
}

/// @nodoc
class _$MenuCopyWithImpl<$Res, $Val extends Menu>
    implements $MenuCopyWith<$Res> {
  _$MenuCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? imageSrc = null,
    Object? category = null,
    Object? recipesHot = null,
    Object? recipesIce = null,
    Object? recipesFrappe = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageSrc: null == imageSrc
          ? _value.imageSrc
          : imageSrc // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as MenuCategories,
      recipesHot: null == recipesHot
          ? _value.recipesHot
          : recipesHot // ignore: cast_nullable_to_non_nullable
              as List<Recipe>,
      recipesIce: null == recipesIce
          ? _value.recipesIce
          : recipesIce // ignore: cast_nullable_to_non_nullable
              as List<Recipe>,
      recipesFrappe: null == recipesFrappe
          ? _value.recipesFrappe
          : recipesFrappe // ignore: cast_nullable_to_non_nullable
              as List<Recipe>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MenuImplCopyWith<$Res> implements $MenuCopyWith<$Res> {
  factory _$$MenuImplCopyWith(
          _$MenuImpl value, $Res Function(_$MenuImpl) then) =
      __$$MenuImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String imageSrc,
      MenuCategories category,
      List<Recipe> recipesHot,
      List<Recipe> recipesIce,
      List<Recipe> recipesFrappe});
}

/// @nodoc
class __$$MenuImplCopyWithImpl<$Res>
    extends _$MenuCopyWithImpl<$Res, _$MenuImpl>
    implements _$$MenuImplCopyWith<$Res> {
  __$$MenuImplCopyWithImpl(_$MenuImpl _value, $Res Function(_$MenuImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? imageSrc = null,
    Object? category = null,
    Object? recipesHot = null,
    Object? recipesIce = null,
    Object? recipesFrappe = null,
  }) {
    return _then(_$MenuImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageSrc: null == imageSrc
          ? _value.imageSrc
          : imageSrc // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as MenuCategories,
      recipesHot: null == recipesHot
          ? _value._recipesHot
          : recipesHot // ignore: cast_nullable_to_non_nullable
              as List<Recipe>,
      recipesIce: null == recipesIce
          ? _value._recipesIce
          : recipesIce // ignore: cast_nullable_to_non_nullable
              as List<Recipe>,
      recipesFrappe: null == recipesFrappe
          ? _value._recipesFrappe
          : recipesFrappe // ignore: cast_nullable_to_non_nullable
              as List<Recipe>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MenuImpl with DiagnosticableTreeMixin implements _Menu {
  const _$MenuImpl(
      {required this.name,
      required this.imageSrc,
      required this.category,
      required final List<Recipe> recipesHot,
      required final List<Recipe> recipesIce,
      required final List<Recipe> recipesFrappe})
      : _recipesHot = recipesHot,
        _recipesIce = recipesIce,
        _recipesFrappe = recipesFrappe;

  factory _$MenuImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenuImplFromJson(json);

  @override
  final String name;
  @override
  final String imageSrc;
  @override
  final MenuCategories category;
  final List<Recipe> _recipesHot;
  @override
  List<Recipe> get recipesHot {
    if (_recipesHot is EqualUnmodifiableListView) return _recipesHot;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recipesHot);
  }

  final List<Recipe> _recipesIce;
  @override
  List<Recipe> get recipesIce {
    if (_recipesIce is EqualUnmodifiableListView) return _recipesIce;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recipesIce);
  }

  final List<Recipe> _recipesFrappe;
  @override
  List<Recipe> get recipesFrappe {
    if (_recipesFrappe is EqualUnmodifiableListView) return _recipesFrappe;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recipesFrappe);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Menu(name: $name, imageSrc: $imageSrc, category: $category, recipesHot: $recipesHot, recipesIce: $recipesIce, recipesFrappe: $recipesFrappe)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Menu'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('imageSrc', imageSrc))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('recipesHot', recipesHot))
      ..add(DiagnosticsProperty('recipesIce', recipesIce))
      ..add(DiagnosticsProperty('recipesFrappe', recipesFrappe));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageSrc, imageSrc) ||
                other.imageSrc == imageSrc) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality()
                .equals(other._recipesHot, _recipesHot) &&
            const DeepCollectionEquality()
                .equals(other._recipesIce, _recipesIce) &&
            const DeepCollectionEquality()
                .equals(other._recipesFrappe, _recipesFrappe));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      imageSrc,
      category,
      const DeepCollectionEquality().hash(_recipesHot),
      const DeepCollectionEquality().hash(_recipesIce),
      const DeepCollectionEquality().hash(_recipesFrappe));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuImplCopyWith<_$MenuImpl> get copyWith =>
      __$$MenuImplCopyWithImpl<_$MenuImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MenuImplToJson(
      this,
    );
  }
}

abstract class _Menu implements Menu {
  const factory _Menu(
      {required final String name,
      required final String imageSrc,
      required final MenuCategories category,
      required final List<Recipe> recipesHot,
      required final List<Recipe> recipesIce,
      required final List<Recipe> recipesFrappe}) = _$MenuImpl;

  factory _Menu.fromJson(Map<String, dynamic> json) = _$MenuImpl.fromJson;

  @override
  String get name;
  @override
  String get imageSrc;
  @override
  MenuCategories get category;
  @override
  List<Recipe> get recipesHot;
  @override
  List<Recipe> get recipesIce;
  @override
  List<Recipe> get recipesFrappe;
  @override
  @JsonKey(ignore: true)
  _$$MenuImplCopyWith<_$MenuImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

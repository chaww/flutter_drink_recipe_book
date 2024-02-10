// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_info_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MenuInfoState {
  Menu get menu => throw _privateConstructorUsedError;
  bool get showEditButton => throw _privateConstructorUsedError;
  int get hotOptionFocus => throw _privateConstructorUsedError;
  int get iceOptionFocus => throw _privateConstructorUsedError;
  int get frappeOptionFocus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MenuInfoStateCopyWith<MenuInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuInfoStateCopyWith<$Res> {
  factory $MenuInfoStateCopyWith(
          MenuInfoState value, $Res Function(MenuInfoState) then) =
      _$MenuInfoStateCopyWithImpl<$Res, MenuInfoState>;
  @useResult
  $Res call(
      {Menu menu,
      bool showEditButton,
      int hotOptionFocus,
      int iceOptionFocus,
      int frappeOptionFocus});

  $MenuCopyWith<$Res> get menu;
}

/// @nodoc
class _$MenuInfoStateCopyWithImpl<$Res, $Val extends MenuInfoState>
    implements $MenuInfoStateCopyWith<$Res> {
  _$MenuInfoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menu = null,
    Object? showEditButton = null,
    Object? hotOptionFocus = null,
    Object? iceOptionFocus = null,
    Object? frappeOptionFocus = null,
  }) {
    return _then(_value.copyWith(
      menu: null == menu
          ? _value.menu
          : menu // ignore: cast_nullable_to_non_nullable
              as Menu,
      showEditButton: null == showEditButton
          ? _value.showEditButton
          : showEditButton // ignore: cast_nullable_to_non_nullable
              as bool,
      hotOptionFocus: null == hotOptionFocus
          ? _value.hotOptionFocus
          : hotOptionFocus // ignore: cast_nullable_to_non_nullable
              as int,
      iceOptionFocus: null == iceOptionFocus
          ? _value.iceOptionFocus
          : iceOptionFocus // ignore: cast_nullable_to_non_nullable
              as int,
      frappeOptionFocus: null == frappeOptionFocus
          ? _value.frappeOptionFocus
          : frappeOptionFocus // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MenuCopyWith<$Res> get menu {
    return $MenuCopyWith<$Res>(_value.menu, (value) {
      return _then(_value.copyWith(menu: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MenuInfoStateImplCopyWith<$Res>
    implements $MenuInfoStateCopyWith<$Res> {
  factory _$$MenuInfoStateImplCopyWith(
          _$MenuInfoStateImpl value, $Res Function(_$MenuInfoStateImpl) then) =
      __$$MenuInfoStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Menu menu,
      bool showEditButton,
      int hotOptionFocus,
      int iceOptionFocus,
      int frappeOptionFocus});

  @override
  $MenuCopyWith<$Res> get menu;
}

/// @nodoc
class __$$MenuInfoStateImplCopyWithImpl<$Res>
    extends _$MenuInfoStateCopyWithImpl<$Res, _$MenuInfoStateImpl>
    implements _$$MenuInfoStateImplCopyWith<$Res> {
  __$$MenuInfoStateImplCopyWithImpl(
      _$MenuInfoStateImpl _value, $Res Function(_$MenuInfoStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menu = null,
    Object? showEditButton = null,
    Object? hotOptionFocus = null,
    Object? iceOptionFocus = null,
    Object? frappeOptionFocus = null,
  }) {
    return _then(_$MenuInfoStateImpl(
      menu: null == menu
          ? _value.menu
          : menu // ignore: cast_nullable_to_non_nullable
              as Menu,
      showEditButton: null == showEditButton
          ? _value.showEditButton
          : showEditButton // ignore: cast_nullable_to_non_nullable
              as bool,
      hotOptionFocus: null == hotOptionFocus
          ? _value.hotOptionFocus
          : hotOptionFocus // ignore: cast_nullable_to_non_nullable
              as int,
      iceOptionFocus: null == iceOptionFocus
          ? _value.iceOptionFocus
          : iceOptionFocus // ignore: cast_nullable_to_non_nullable
              as int,
      frappeOptionFocus: null == frappeOptionFocus
          ? _value.frappeOptionFocus
          : frappeOptionFocus // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$MenuInfoStateImpl implements _MenuInfoState {
  const _$MenuInfoStateImpl(
      {required this.menu,
      this.showEditButton = false,
      this.hotOptionFocus = 0,
      this.iceOptionFocus = 0,
      this.frappeOptionFocus = 0});

  @override
  final Menu menu;
  @override
  @JsonKey()
  final bool showEditButton;
  @override
  @JsonKey()
  final int hotOptionFocus;
  @override
  @JsonKey()
  final int iceOptionFocus;
  @override
  @JsonKey()
  final int frappeOptionFocus;

  @override
  String toString() {
    return 'MenuInfoState(menu: $menu, showEditButton: $showEditButton, hotOptionFocus: $hotOptionFocus, iceOptionFocus: $iceOptionFocus, frappeOptionFocus: $frappeOptionFocus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuInfoStateImpl &&
            (identical(other.menu, menu) || other.menu == menu) &&
            (identical(other.showEditButton, showEditButton) ||
                other.showEditButton == showEditButton) &&
            (identical(other.hotOptionFocus, hotOptionFocus) ||
                other.hotOptionFocus == hotOptionFocus) &&
            (identical(other.iceOptionFocus, iceOptionFocus) ||
                other.iceOptionFocus == iceOptionFocus) &&
            (identical(other.frappeOptionFocus, frappeOptionFocus) ||
                other.frappeOptionFocus == frappeOptionFocus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, menu, showEditButton,
      hotOptionFocus, iceOptionFocus, frappeOptionFocus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuInfoStateImplCopyWith<_$MenuInfoStateImpl> get copyWith =>
      __$$MenuInfoStateImplCopyWithImpl<_$MenuInfoStateImpl>(this, _$identity);
}

abstract class _MenuInfoState implements MenuInfoState {
  const factory _MenuInfoState(
      {required final Menu menu,
      final bool showEditButton,
      final int hotOptionFocus,
      final int iceOptionFocus,
      final int frappeOptionFocus}) = _$MenuInfoStateImpl;

  @override
  Menu get menu;
  @override
  bool get showEditButton;
  @override
  int get hotOptionFocus;
  @override
  int get iceOptionFocus;
  @override
  int get frappeOptionFocus;
  @override
  @JsonKey(ignore: true)
  _$$MenuInfoStateImplCopyWith<_$MenuInfoStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

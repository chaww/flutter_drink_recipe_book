part of 'menu_info_cubit.dart';

@freezed
class MenuInfoState with _$MenuInfoState {
  const factory MenuInfoState({
    required Menu menu,
    @Default(false) bool showEditButton,
    @Default(0) int hotOptionFocus,
    @Default(0) int iceOptionFocus,
    @Default(0) int frappeOptionFocus,
  }) = _MenuInfoState;
}

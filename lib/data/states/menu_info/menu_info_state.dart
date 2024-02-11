// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'menu_info_cubit.dart';

class MenuInfoState extends Equatable {
  final Menu menu;
  final bool showEditButton;
  final int hotOptionFocus;
  final int iceOptionFocus;
  final int frappeOptionFocus;
  const MenuInfoState({
    required this.menu,
    this.showEditButton = false,
    this.hotOptionFocus = 0,
    this.iceOptionFocus = 0,
    this.frappeOptionFocus = 0,
  });

  MenuInfoState copyWith({
    Menu? menu,
    bool? showEditButton,
    int? hotOptionFocus,
    int? iceOptionFocus,
    int? frappeOptionFocus,
  }) {
    return MenuInfoState(
      menu: menu ?? this.menu,
      showEditButton: showEditButton ?? this.showEditButton,
      hotOptionFocus: hotOptionFocus ?? this.hotOptionFocus,
      iceOptionFocus: iceOptionFocus ?? this.iceOptionFocus,
      frappeOptionFocus: frappeOptionFocus ?? this.frappeOptionFocus,
    );
  }

  @override
  List<Object> get props {
    return [
      menu,
      showEditButton,
      hotOptionFocus,
      iceOptionFocus,
      frappeOptionFocus,
    ];
  }
}

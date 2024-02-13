// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_drink_recipe_book/data/entities/menu.dart';
import 'package:flutter_drink_recipe_book/presenter/assets.gen.dart';
import 'package:flutter_drink_recipe_book/presenter/pages/menu_info/menu_info.dart';
import 'package:flutter_drink_recipe_book/presenter/themes/extensions.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.menu,
  });

  final Menu menu;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final height = constraints.maxHeight * 0.7;

        return Card(
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MenuInfoPage.route(menu: menu));
            },
            child: Stack(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: height,
                      child: menu.imageSrc == ''
                          ? Padding(
                              padding: EdgeInsets.all(24),
                              child: Image(
                                image: context.appTheme.name == 'light'
                                    ? Assets.hidden.logoLight.provider()
                                    : Assets.hidden.logoDark.provider(),
                                fit: BoxFit.contain,
                              ),
                            )
                          : Center(
                              child: Image(
                                image: FileImage(File(menu.imageSrc)),
                                fit: BoxFit.contain,
                              ),
                            ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Text(
                            menu.nameTh,
                            style: context.typographies.body,
                          ),
                          Text(
                            menu.nameEn.isNotEmpty ? '(${menu.nameEn})' : '',
                            style: context.typographies.body,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

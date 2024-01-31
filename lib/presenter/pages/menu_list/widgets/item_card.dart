// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_drink_recipe_book/presenter/pages/menu_info/menu_info.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final height = constraints.maxHeight;
        log('$height');

        return Card(
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MenuInfoPage.route());
            },
            child: Stack(
              children: [
                Column(
                  children: [
                    Placeholder(
                      fallbackHeight: height * 0.7,
                      // fallbackWidth: 100,
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text('ชื่อเมนู'),
                    ),
                  ],
                ),
              ],
            ),
            // children: [
            //   Row(
            //     children: [
            //       Text('ชื่อเมนู'),
            //       Spacer(),
            //     ],
            //   ),
            //   Row(
            //     children: [
            //       Placeholder(
            //         child: SizedBox(
            //           width: constraints.maxWidth - 50,
            //           height: constraints.maxWidth - 50,
            //         ),
            //       ),
            //       Column(
            //         children: [
            //           Icon(Icons.coffee),
            //           Icon(Icons.ac_unit),
            //           Icon(Icons.scatter_plot),
            //         ],
            //       ),
            //     ],
            //   ),
            // ],
          ),
        );
      },
    );
  }
}

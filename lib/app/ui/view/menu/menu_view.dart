// ignore_for_file: must_be_immutable

import 'package:apmatik/app/core/base/base_view.dart';
import 'package:apmatik/app/core/constant/padding_constants.dart';
import 'package:apmatik/app/ui/view/menu/menu_controller.dart';
import 'package:flutter/material.dart';

class MenuView extends BaseView<MenuController> {
  MenuView({Key? key}) : super(key: key, appBarHide: false);

  @override
  Widget vBuilder() => Padding(
        padding: AppPadding.guideLine,
        child: ListView(children: [
          AnimatedList(
            physics:const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            key: controller.listKey,
            padding: const EdgeInsets.only(top: 10),
            initialItemCount: controller.listItems.length,
            itemBuilder: (context, index, animation) {
              return SlideTransition(
                position: CurvedAnimation(
                  curve: Curves.easeOut,
                  parent: animation,
                ).drive((Tween<Offset>(
                  begin: const Offset(1, 0),
                  end: const Offset(0, 0),
                ))),
                child: controller.listItems[index],
              );
            },
          ),
        ]),
      );
}

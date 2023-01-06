import 'package:apmatik/app/core/base/base_view.dart';
import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/core/constant/decoration_constants.dart';
import 'package:apmatik/app/core/constant/padding_constants.dart';
import 'package:apmatik/app/ui/view/cars/add_cars/add_cars_controller.dart';
import 'package:flutter/material.dart';

class AddCarsView extends BaseView<AddCarsController> {
  AddCarsView({Key? key}) : super(key: key, appBarHide: false);
  @override
  Widget vBuilder() => Padding(
        padding: AppPadding.horizontal20,
        child: ListView(
          children: [
            Container(
              decoration: CustomDecoration.defaultShadow,
              child: TextField(
                style: appTextStyle.getSfProDisplayMedium_H6(AppColors.ORANGE),
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 10,
              ),
            ),
          ],
        ),
      );
}

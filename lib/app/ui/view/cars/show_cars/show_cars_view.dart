import 'package:apmatik/app/core/base/base_view.dart';
import 'package:apmatik/app/core/constant/asset_constants.dart';
import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/core/constant/decoration_constants.dart';
import 'package:apmatik/app/ui/view/cars/show_cars/show_cars_controller.dart';
import 'package:apmatik/app/ui/widgets/custom_cards/plate_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ShowCarsView extends BaseView<ShowCarsController> {
  ShowCarsView({Key? key}) : super(key: key, appBarHide: false);
  @override
  Widget vBuilder() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return const Divider(
              color: AppColors.WHITE,
            );
          },
          itemCount: 5,
          itemBuilder: (context, index) {
            return PlateCardWidget(
              width: 310.w,
              height: 30.h,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                width: 310.w,
                height: 30.h,
                decoration: CustomDecoration.defaultShadow,
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      controller.cars[index].toString(),
                      style: appTextStyle
                          .get_SfProRounded_SemiBold_h5(AppColors.ORANGE),
                    ),
                    GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(
                          AppAssets.remove_icon,
                          color: AppColors.BLACK,
                        ))
                  ],
                )),
              ),
            );
          },
        ),
      );
}

import 'package:apmatik/app/core/base/base_view.dart';
import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/ui/style/text_style.dart';
import 'package:apmatik/app/ui/view/common/common_view.dart';
import 'package:apmatik/app/ui/widgets/custom_cards/image_with_text_slider_card.dart';
import 'package:apmatik/app/ui/widgets/custom_appbars/login_appbar.dart';
import 'package:apmatik/app/ui/widgets/custom_cards/post_card.dart';
import 'package:apmatik/app/ui/widgets/custom_cards/questionnaire_card.dart';
import 'package:apmatik/app/ui/widgets/custom_cards/sponsored_card_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomeView extends BaseView<HomeController> {
  HomeView({Key? key})
      : super(
          key: key,
          navBarHide: false,
        );
  @override
  Widget vBuilder() => Scaffold(
      appBar: CustomLoginUserAppBar(),
      body: controller.hasApertmenKey ?? false
          ? ListView(children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Text(
                  'Avantajlarımız',
                  style:
                      AppTextStyle().getSfProDisplayRegular_H5(AppColors.BLACK),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 10),
                child: CarouselSlider.builder(
                  itemCount: controller.imgList.length,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      Container(
                    child: ImageWithTextSliderCard(
                      imageWidget: Image.network(
                        controller.imgList[itemIndex],
                        width: 121,
                        height: 158,
                        fit: BoxFit.cover,
                      ),
                      imageTitle: 'Kış Masalı',
                      imageDescription: 'Kış Masalı',
                    ),
                  ),
                  carouselController: controller.carouselController,
                  options: CarouselOptions(
                      padEnds: false,
                      scrollPhysics: BouncingScrollPhysics(),
                      initialPage: 0,
                      viewportFraction: 0.3,
                      autoPlay: false,
                      enlargeCenterPage: false,
                      enableInfiniteScroll: false,
                      aspectRatio: 2.5,
                      onPageChanged: (index, reason) {
                        controller.current = index;
                        controller.update();
                      }),
                ),
              ),
              DotsIndicator(
                dotsCount: controller.imgList.length,
                position: controller.current.toDouble(),
                decorator: DotsDecorator(
                  color: Colors.black87, // Inactive color
                  activeColor: AppColors.ORANGE,
                  size: const Size.square(9.0),
                  activeSize: const Size(18.0, 9.0),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
              Divider(
                height: 20,
                thickness: 2.2,
                color: Colors.blueGrey.shade100,
              ),
              Padding(
                padding: Get.width >= 390
                    ? EdgeInsets.only(right: 250.w, left: 25.w)
                    : EdgeInsets.only(right: 250.w, left: 25.w),
                child: DropdownButton(
                    hint: Text(
                      controller.selectedValue,
                      style: AppTextStyle()
                          .getSfProDisplayMedium_H6(AppColors.BLACK),
                    ),
                    value: controller.selectedValue,
                    items: controller.cardlist.map((String val) {
                      return DropdownMenuItem(
                        value: val,
                        child: Text(
                          val,
                          style: AppTextStyle()
                              .getSfProDisplayMedium_H6(AppColors.BLACK),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? item) {
                      controller.selectedValue = item!;
                      controller.update();
                    }),
              ),
              if (controller.selectedValue == 'Anketler')
                QuestionnaireCardWidget(onPressed: () {
                  Get.toNamed('questionnaire_detail');
                }),
              if (controller.selectedValue == 'Duyurular') PostCardWidget(),
              if (controller.selectedValue == 'Sponsorlar')
                SponsoredCardWidget()
            ])
          : Container(
              width: double.infinity,
              height: Get.height,
              child: CommonView().buildNoApartmenRecord()));
}

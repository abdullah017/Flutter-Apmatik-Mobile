// ignore_for_file: avoid_print

import 'package:apmatik/app/core/base/base_view.dart';
import 'package:apmatik/app/core/constant/asset_constants.dart';
import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/core/constant/padding_constants.dart';
import 'package:apmatik/app/ui/style/text_style.dart';
import 'package:apmatik/app/ui/view/common/common_view.dart';
import 'package:apmatik/app/ui/widgets/custom_cards/image_with_text_slider_card.dart';
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
  HomeView({Key? key}) : super(key: key, appBarHide: false);
  @override
  Widget vBuilder() => controller.hasApertmenKey ?? false
      ? WillPopScope(
          onWillPop: () {
            return controller.onWillPop();
          },
          child: ListView(children: [
            Padding(
              padding: AppPadding.horizontal10Vertical8,
              child: Text(
                'Avantajlarımız',
                style:
                    AppTextStyle().getSfProDisplayRegular_H5(AppColors.BLACK),
              ),
            ),
            Padding(
              padding: AppPadding.horizontal10Vertical8,
              child: CarouselSlider.builder(
                itemCount: controller.imgList.length,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) =>
                        ImageWithTextSliderCard(
                  imageWidget: FadeInImage.assetNetwork(
                    width: 121,
                    height: 158,
                    fit: BoxFit.cover,
                    image: controller.imgList[itemIndex],
                    placeholder: AppAssets.placeholder,
                  ),
                  imageTitle: 'Kış Masalı',
                  imageDescription: 'Kış Masalı',
                ),
                carouselController: controller.carouselController,
                options: CarouselOptions(
                    padEnds: false,
                    scrollPhysics: const BouncingScrollPhysics(),
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
              dotsCount: controller.imgList.length - 2,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: Get.width == 390.w
                      ? EdgeInsets.only(left: 250.w, right: 24.w)
                      : EdgeInsets.only(left: 250.w, right: 20.w),
                  child: DropdownButtonHideUnderline(
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
                          print(controller.selectedValue);
                          if (item == 'Anketler') {
                            controller.subPageId = 0;
                          }
                          if (item == 'Duyurular') {
                            controller.subPageId = 1;
                          }
                          if (item == 'Sponsorlar') {
                            controller.subPageId = 2;
                          }
                          if (item == 'Tümü') {
                            controller.subPageId = 3;
                          }
                          controller.update();
                        }),
                  ),
                ),
              ],
            ),
            if (controller.subPageId == 0)
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: ((context, index) {
                  return QuestionnaireCardWidget(
                    onPressed: () {
                      Get.toNamed('questionnaire_detail');
                    },
                  );
                }),
              ),
            if (controller.subPageId == 1)
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: ((context, index) {
                  return PostCardWidget(
                    postUserImage: 'https://via.placeholder.com/150',
                    postUser: 'Ahmet Pehlivan',
                    postImage:
                        "https://images.squarespace-cdn.com/content/v1/5c4e41d2b40b9d6e2ab467ff/1612855779673-B5L9FMMXBC4NWRG4N0YF/residential-trash-services.jpg?format=1500w",
                    postDescription:
                        'Çevremize ve binamıza verdiğimiz önem desteklerinizi bekliyor',
                    postTime: '8',
                    postTitle: 'Çöpler Hakkında',
                  );
                }),
              ),
            if (controller.subPageId == 2)
              const SponsoredCardWidget(
                imageUrl:
                    'https://jiujitsutimes.com/wp-content/uploads/sponsored-slider.png',
              ),
            if (controller.subPageId == 3)
              Column(
                children: [
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: 2,
                    itemBuilder: ((context, index) {
                      return QuestionnaireCardWidget(
                        onPressed: () {
                          Get.toNamed('questionnaire_detail');
                        },
                      );
                    }),
                  ),
                  PostCardWidget(
                    postUserImage: 'https://via.placeholder.com/150',
                    postUser: 'Ahmet Pehlivan',
                    postImage:
                        "https://images.squarespace-cdn.com/content/v1/5c4e41d2b40b9d6e2ab467ff/1612855779673-B5L9FMMXBC4NWRG4N0YF/residential-trash-services.jpg?format=1500w",
                    postDescription:
                        'Çevremize ve binamıza verdiğimiz önem desteklerinizi bekliyor',
                    postTime: '8',
                    postTitle: 'Çöpler Hakkında',
                  ),
                  const SponsoredCardWidget(
                    imageUrl:
                        'https://jiujitsutimes.com/wp-content/uploads/sponsored-slider.png',
                  ),
                ],
              )
          ]),
        )
      : Container(
          margin: EdgeInsets.only(top: Get.height * 0.15),
          width: double.infinity,
          height: Get.height,
          child: CommonView().buildNoApartmenRecord());
}

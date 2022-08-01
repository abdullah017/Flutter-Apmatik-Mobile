// ignore_for_file: must_be_immutable

import 'package:apmatik/app/core/base/base_view.dart';
import 'package:apmatik/app/core/constant/asset_constants.dart';
import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/ui/style/text_style.dart';
import 'package:apmatik/app/ui/view/profile/edit_profile/edit_profile_controller.dart';
import 'package:apmatik/app/ui/widgets/custom_appbars/custom_appbar.dart';
import 'package:apmatik/app/ui/widgets/custom_buttons/custom_cupertinoswitch.dart';
import 'package:apmatik/app/ui/widgets/custom_buttons/custom_elevated_button.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileView extends BaseView<EditProfileController> {
  @override
  Widget vBuilder() => Scaffold(
      backgroundColor: AppColors.PAGEBACKGROUND,
      appBar: CustomAppBar(),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0.h),
            child: Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.ORANGE,
                    backgroundImage: AssetImage(AppAssets.appbar),
                    radius: 35.r,
                  ),
                  Positioned(
                    bottom: 0,
                    left: 45,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 4,
                            color: Colors.orange,
                          )),
                      child: Icon(
                        Icons.edit,
                        size: 12,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Center(
            child: Text.rich(
              TextSpan(
                text: 'Mustafa Dilmaç\n',
                style:
                    appTextStyle.getSfProDisplaySemiBold_h6(AppColors.ORANGE),
                children: [
                  TextSpan(
                      text: 'mdilmac@gmail.com',
                      style: appTextStyle
                          .getSfProDisplayRegular_H6(AppColors.BLACK)),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
            child: Text('Telefon Numarası'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
            child: Container(
              width: 330.w,
              height: 30.h,
              child: TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 10.0.h, horizontal: 10.0.h),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text('Meslek'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
            child: Theme(
              data: ThemeData(
                  textTheme: TextTheme(
                      subtitle1: AppTextStyle()
                          .getSfProDisplayMedium_H6(AppColors.BLACK))),
              child: Container(
                width: 330.w,
                height: 30.h,
                child: DropdownSearch<String>(
                  dropdownButtonProps: DropdownButtonProps(
                    padding: EdgeInsets.only(left: 20.w),
                  ),
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  popupProps: PopupProps.menu(
                    showSearchBox: true,
                    showSelectedItems: true,
                    disabledItemFn: (String s) => s.startsWith('I'),
                  ),
                  items: controller.joblist,
                  onChanged: print,
                  //show selected item
                  selectedItem: "Öğrenci",
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text('Medeni Durumu'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
            child: Theme(
              data: ThemeData(
                textTheme: TextTheme(
                  subtitle1:
                      AppTextStyle().getSfProDisplayMedium_H6(AppColors.BLACK),
                ),
              ),
              child: Container(
                width: 330.w,
                height: 30.h,
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
                    border: OutlineInputBorder(),
                  ),
                  items: controller.durum.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (val) {},
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text('Çocuk Sayısı'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
            child: Theme(
              data: ThemeData(
                textTheme: TextTheme(
                  subtitle1:
                      AppTextStyle().getSfProDisplayMedium_H6(AppColors.BLACK),
                ),
              ),
              child: Container(
                width: 330.w,
                height: 30.h,
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
                    border: OutlineInputBorder(),
                  ),
                  items: controller.durum.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (val) {},
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text('Evcil Hayvanım'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
            child: Theme(
              data: ThemeData(
                textTheme: TextTheme(
                  subtitle1:
                      AppTextStyle().getSfProDisplayMedium_H6(AppColors.BLACK),
                ),
              ),
              child: Container(
                width: 330.w,
                height: 30.h,
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
                    border: OutlineInputBorder(),
                  ),
                  items: controller.durum.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (val) {},
                ),
              ),
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0.w),
            child: Card(
              child: Container(
                width: 350.w,
                height: 30.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Beni Diğer Sakinlere Göster'),
                    CustomCupertinoSwitch(
                      value: controller.toggle,
                      onChanged: (value) {
                        controller.toggle = value;
                        controller.update();
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Sakinler sizin tamaladığınız anketleri ve paylaştığınız postlarda isim soyisim ve profil resminizi görebilir. Diğer bilgileriniz saklı tutulur.',
              style: appTextStyle.getSfProDisplayLight_H6(AppColors.GREY),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          CustomElevatedButton(
            onPressed: () {},
            child: Text('Güncelle'),
          ),
        ],
      ));
}

import 'package:apmatik/app/core/base/base_view.dart';
import 'package:apmatik/app/core/constant/asset_constants.dart';
import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/ui/style/text_style.dart';
import 'package:apmatik/app/ui/view/menu/profile/edit_profile/edit_profile_controller.dart';
import 'package:apmatik/app/ui/widgets/custom_buttons/custom_cupertinoswitch.dart';
import 'package:apmatik/app/ui/widgets/custom_buttons/custom_dropdown_formfield_button.dart';
import 'package:apmatik/app/ui/widgets/custom_buttons/custom_elevated_button.dart';
import 'package:apmatik/app/ui/widgets/custom_inputs/custom_filled_textformfield.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EditProfileView extends BaseView<EditProfileController> {
  EditProfileView({Key? key})
      : super(key: key, navBarHide: true, appBarHide: false);
  @override
  Widget vBuilder() => ListView(
        children: [
          buildProfilePhoto(),
          buildNameAndMail(),
          SizedBox(
            height: 15.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text('phoneNumberLabel'.tr,
                style: appTextStyle.getSfProDisplayRegular_H5(AppColors.BLACK)),
          ),
          SizedBox(
            height: 3.h,
          ),
          buildPhoneNumberTextFormField(),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text('job'.tr,
                style: appTextStyle.getSfProDisplayRegular_H5(AppColors.BLACK)),
          ),
          buildJobDropdownSearchButton(),
          SizedBox(
            height: 5.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text('marital'.tr,
                style: appTextStyle.getSfProDisplayRegular_H5(AppColors.BLACK)),
          ),
          buildMaritalStatusDropdownButton(),
          SizedBox(
            height: 5.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text('number_children'.tr,
                style: appTextStyle.getSfProDisplayRegular_H5(AppColors.BLACK)),
          ),
          buildNumberChildDropdownButton(),
          SizedBox(
            height: 5.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text('have_pet'.tr,
                style: appTextStyle.getSfProDisplayRegular_H5(AppColors.BLACK)),
          ),
          buildPetCustomDropdownButton(),
          SizedBox(
            height: 1.h,
          ),
          buildShowMeOtherSwitch(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'show_other_info'.tr,
              style: appTextStyle.getSfProDisplayLight_H6(AppColors.GREY),
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          CustomElevatedButton(
            onPressed: () {},
            child: Text('updateButton'.tr),
          ),
        ],
      );

  Padding buildProfilePhoto() {
    return Padding(
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
    );
  }

  Center buildNameAndMail() {
    return Center(
      child: Text.rich(
        TextSpan(
          text: 'Mustafa Dilmaç\n',
          style: appTextStyle.getSfProDisplayBold_H5(AppColors.ORANGE),
          children: [
            TextSpan(
                text: 'mdilmac@gmail.com',
                style: appTextStyle.getSfProDisplayRegular_H5(AppColors.BLACK)),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  buildPhoneNumberTextFormField() {
    return CustomFilledTextFormField(
      textEditingController: controller.phoneNumberController,
    );
  }

  Padding buildJobDropdownSearchButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
      child: Theme(
        data: ThemeData(
            textTheme: TextTheme(
                subtitle1:
                    appTextStyle.getSfProDisplayRegular_H5(AppColors.BLACK))),
        child: Container(
          width: 330.w,
          height: 30.h,
          child: DropdownSearch<String>(
            dropdownButtonProps: DropdownButtonProps(
              icon: Transform.translate(
                  offset: Offset(-8, 0),
                  child: Image.asset(AppAssets.dropdown_icon)),
              padding: EdgeInsets.only(left: 20.w),
            ),
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                filled: true,
                fillColor: AppColors.WHITE,
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColors.WHITE_GREY, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColors.WHITE_GREY, width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.ORANGE, width: 1.0),
                ),
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
            selectedItem: "Yazılım Geliştiricisi",
          ),
        ),
      ),
    );
  }

  Padding buildMaritalStatusDropdownButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      child: Theme(
        data: ThemeData(
          textTheme: TextTheme(
            subtitle1:
                AppTextStyle().getSfProDisplayRegular_H5(AppColors.BLACK),
          ),
        ),
        child: Container(
          width: 330.w,
          height: 30.h,
          child: CustomDropdownButtonFormField(
            isBordered: true,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            value: 'Evli',
            items: controller.marital.map((String val) {
              return DropdownMenuItem(
                value: val,
                child: Text(
                  val,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Padding buildNumberChildDropdownButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      child: Theme(
        data: ThemeData(
          textTheme: TextTheme(
            subtitle1:
                AppTextStyle().getSfProDisplayRegular_H5(AppColors.BLACK),
          ),
        ),
        child: Container(
          width: 330.w,
          height: 30.h,
          child: CustomDropdownButtonFormField(
            isBordered: true,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            value: '2 çocuk',
            items: controller.listOfChildValue.map((String val) {
              return DropdownMenuItem(
                value: val,
                child: Text(
                  val,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Padding buildPetCustomDropdownButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      child: Theme(
        data: ThemeData(
          textTheme: TextTheme(
            subtitle1:
                AppTextStyle().getSfProDisplayRegular_H5(AppColors.BLACK),
          ),
        ),
        child: Container(
          width: 330.w,
          height: 30.h,
          child: CustomDropdownButtonFormField(
            isBordered: true,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            value: 'Var',
            items: controller.pet.map((String val) {
              return DropdownMenuItem(
                value: val,
                child: Text(
                  val,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Padding buildShowMeOtherSwitch() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0.w),
      child: Card(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0.w),
          width: 350.w,
          height: 30.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('show_me_other'.tr,
                  style:
                      appTextStyle.getSfProDisplayRegular_H5(AppColors.BLACK)),
              Spacer(),
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
    );
  }
}

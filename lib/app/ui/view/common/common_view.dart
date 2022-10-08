import 'package:apmatik/app/core/base/base_view.dart';
import 'package:apmatik/app/core/constant/asset_constants.dart';
import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/ui/style/text_style.dart';
import 'package:apmatik/app/ui/view/common/common_controller.dart';
import 'package:apmatik/app/ui/widgets/custom_buttons/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CommonView extends BaseView<CommonController> {
  final IconData? icon;
  final Color? iconColor;
  final String? title;
  final String? subTitle;
  final String? buttonText;
  final bool? buttonShow;
  final bool? logoShow;

  CommonView({
    this.icon,
    this.iconColor,
    this.title,
    this.subTitle,
    this.buttonText,
    this.buttonShow,
    this.logoShow,
    Key? key,
  }) : super(key: key);

  @override
  Widget vBuilder() => Scaffold(
        body: controller.status == 'registerSuccess'
            ? buildRegisterSuccessWidget()
            : controller.status == 'resetPasswordSuccess'
                ? buildResetPasswordSuccessWidget()
                : controller.status == 'noConnection'
                    ? buildNoConnectionWidget()
                    : controller.status == 'oldVersionApp'
                        ? buildOldVersionAppWidget()
                        : controller.status == 'verifyError'
                            ? buildVerifyError()
                            : controller.status == 'noApartmenRecord'
                                ? buildNoApartmenRecord()
                                : controller.status ==
                                        'registerApartmentSuccess'
                                    ? buildRegisterApartmentSuccessWidget()
                                    : controller.status == 'paymentSuccess'
                                        ? buildPaymentSuccess()
                                        : Container(),
      );

  Center buildPaymentFail() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 23.0),
              child: SvgPicture.asset(
                AppAssets.payment_fail,
                width: 66,
                height: 66,
                color: AppColors.RED,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'ÖDEME BAŞARISIZ',
              style: appTextStyle.get_SfProRounded_SemiBold_h5(AppColors.BLACK),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
            child: Text(
              'Ödemeniz alınırken bir sorun oluştu. Lütfen daha ödeme işlemini tekrar deneyin.',
              style: appTextStyle.getSfProDisplayRegular_H5(AppColors.BLACK),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: CustomElevatedButton(
              onPressed: () {
                controller.goToHome();
              },
              child: Text('completed'.tr),
            ),
          ),
          SizedBox(
            height: Get.height * 0.20,
          )
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 81.0),
          //   child: Image.asset(
          //     AppAssets.statusPageLogo,
          //     color: Colors.grey,
          //     width: 90.w,
          //     height: 65.h,
          //   ),
          // )
        ],
      ),
    );
  }

  Center buildPaymentSuccess() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 23.0),
              child: SvgPicture.asset(
                AppAssets.payment_success,
                width: 66,
                height: 66,
                color: AppColors.ORANGE,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'ÖDEME BAŞARILI',
              style: appTextStyle.get_SfProRounded_SemiBold_h5(AppColors.BLACK),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
            child: Text(
              'Ödemeniz başarılı bir şekilde tamamlanmıştır. Ödemeniz hesabınıza hemen yansıtılmıştır. Ödemeniz için teşekkür ederiz.',
              style: appTextStyle.getSfProDisplayRegular_H5(AppColors.BLACK),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: CustomElevatedButton(
              onPressed: () {
                controller.goToHome();
              },
              child: Text('completed'.tr),
            ),
          ),
          SizedBox(
            height: Get.height * 0.20,
          )
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 81.0),
          //   child: Image.asset(
          //     AppAssets.statusPageLogo,
          //     color: Colors.grey,
          //     width: 90.w,
          //     height: 65.h,
          //   ),
          // )
        ],
      ),
    );
  }

  Center buildNoConnectionWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(vertical: 23.0.h),
              child: SvgPicture.asset(
                AppAssets.wifi_icon,
                width: 66.w,
                height: 66.h,
                color: AppColors.BLACK,
              )),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0.h),
            child: Text(
              'noConnection'.tr,
              style: appTextStyle.get_SfProRounded_SemiBold_h5(AppColors.BLACK),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 20.w),
            child: Text(
              'noConnectionInfo'.tr,
              style: appTextStyle.getSfProDisplayRegular_H5(AppColors.BLACK),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0.h),
            child: CustomElevatedButton(
              onPressed: () {},
              child: Text('tryAgain'.tr),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 81.0.h),
            child: Image.asset(
              AppAssets.statusPageLogo,
              color: Colors.grey,
              width: 90.w,
              height: 65.h,
            ),
          )
        ],
      ),
    );
  }

  Center buildOldVersionAppWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 23.0),
              child: SvgPicture.asset(
                AppAssets.old_app_icon,
                width: 66,
                height: 66,
                color: AppColors.BLACK,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'oldAppVersion'.tr,
              style: appTextStyle.get_SfProRounded_SemiBold_h5(AppColors.BLACK),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
            child: Text(
              'oldAppVersionInfo'.tr,
              style: appTextStyle.getSfProDisplayRegular_H5(AppColors.BLACK),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 81.0),
            child: Image.asset(
              AppAssets.statusPageLogo,
              color: Colors.grey,
              width: 90.w,
              height: 65.h,
            ),
          )
        ],
      ),
    );
  }

  Center buildVerifyError() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 23.0),
              child: SvgPicture.asset(
                AppAssets.verify_icon,
                width: 66,
                height: 66,
                color: AppColors.BLACK,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'verifyError'.tr,
              style: appTextStyle.get_SfProRounded_SemiBold_h5(AppColors.BLACK),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
            child: Text(
              'verifyErrorınfo'.tr,
              style: appTextStyle.getSfProDisplayRegular_H5(AppColors.BLACK),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: CustomElevatedButton(
              onPressed: () {},
              child: Text('tryAgain'.tr),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text('reportProblem'.tr,
                style: appTextStyle.getSfProDisplayRegular_H5(AppColors.BLACK)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 81.0),
            child: Image.asset(
              AppAssets.statusPageLogo,
              color: Colors.grey,
              width: 90.w,
              height: 65.h,
            ),
          )
        ],
      ),
    );
  }

  Center buildNoApartmenRecord() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0.h),
              child: SvgPicture.asset(
                AppAssets.apart_icon,
                width: 66.w,
                height: 66.h,
                color: AppColors.BLACK,
              )),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0.h),
            child: Text(
              'noApertmenRecord'.tr,
              style: appTextStyle.get_SfProRounded_SemiBold_h5(AppColors.BLACK),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 20.w),
            child: Text(
              'noApertmenRecordInfo'.tr,
              style: appTextStyle.getSfProDisplayRegular_H5(AppColors.BLACK),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0.h),
            child: CustomElevatedButton(
              onPressed: () {
                controller.goAddApartment();
              },
              child: Text(
                'noApertmenRecordButton'.tr,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text('reportProblem'.tr,
                style: appTextStyle.getSfProDisplayRegular_H5(AppColors.BLACK)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 81.0.h),
            child: Image.asset(
              AppAssets.statusPageLogo,
              color: Colors.grey,
              width: 90.w,
              height: 65.h,
            ),
          )
        ],
      ),
    );
  }

  Center buildRegisterApartmentSuccessWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 23.0),
              child: SvgPicture.asset(
                AppAssets.verify_icon,
                width: 66,
                height: 66,
                color: AppColors.BLACK,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'successRecordApartmen'.tr,
              style: appTextStyle.get_SfProRounded_SemiBold_h5(AppColors.BLACK),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
            child: Text(
              'successRecordApartmenInfo'.tr,
              style: appTextStyle.getSfProDisplayRegular_H5(AppColors.BLACK),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: CustomElevatedButton(
              onPressed: () {
                controller.goToHome();
              },
              child: Text('completed'.tr),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 81.0),
            child: Image.asset(
              AppAssets.statusPageLogo,
              color: Colors.grey,
              width: 90.w,
              height: 65.h,
            ),
          )
        ],
      ),
    );
  }

  Center buildResetPasswordSuccessWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 23.0),
              child: SvgPicture.asset(
                AppAssets.done_icon,
                width: 66,
                height: 66,
                color: AppColors.BLACK,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'resetPasswordSuccess'.tr,
              style: AppTextStyle().getSfProDisplayBold_H5(AppColors.BLACK),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text('resetPasswordInfo'.tr),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: CustomElevatedButton(
              onPressed: () {},
              child: Text(
                'loginButton'.tr,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Center buildRegisterSuccessWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 23.0),
              child: SvgPicture.asset(
                AppAssets.done_icon,
                width: 90,
                height: 90,
                color: AppColors.ORANGE,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'registerSuccess'.tr,
              style: AppTextStyle().getSfProDisplayBold_H5(AppColors.BLACK),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
            child: Text(
              'registerSuccessInfo'.tr,
              textAlign: TextAlign.center,
              style: AppTextStyle().getSfProDisplayRegular_H5(AppColors.BLACK),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: CustomElevatedButton(
              onPressed: () {
                controller.goLogin();
              },
              child: Text('loginButton'.tr),
            ),
          ),
          Visibility(
            visible: logoShow ?? false,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 81.0),
              child: Image.asset(
                AppAssets.statusPageLogo,
                color: Colors.grey,
                width: 90.w,
                height: 65.h,
              ),
            ),
          )
        ],
      ),
    );
  }
}

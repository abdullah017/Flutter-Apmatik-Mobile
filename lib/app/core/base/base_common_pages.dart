// ignore_for_file: deprecated_member_use

import 'package:apmatik_app/app/core/constant/color_constants.dart';
import 'package:apmatik_app/app/ui/style/text_style.dart';
import 'package:apmatik_app/app/ui/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'base_controller.dart';

///
/// --------------------------------------------
/// There are many amazing [Function]s in this class.
/// Especialy in user interactions.
/// You can find and use on your Controller wich is the Controller extends [BaseController].
class BaseCommonPages implements _CommonPagesInterface {
  registerSuccess(
      {String? title,
      String? info,
      IconData? icon,
      required Function()? onPressed,
      required String buttonText}) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: AppColors.ORANGE,
              radius: 40,
              child: Icon(
                icon ?? Icons.done_outline_rounded,
                size: 50,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              title ?? 'Kaydınız Başarı İle Tamamlandı',
              style: AppTextStyle().getSfProDisplayBold_h6(AppColors.BLACK),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0.w, vertical: 1.h),
              child: Text(
                info ??
                    'Apmatik kaydınız tamamlanmıştır. Hemen muhiti olduğunuz apartmanı ekleyin ve sizde evinizi cebinizden takip edin!',
                textAlign: TextAlign.center,
                style: AppTextStyle()
                    .getSfProDisplayRegular_H6(AppColors.GREY_OPACITY),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomElevatedButton(
                onPressed: onPressed ?? null, child: Text('$buttonText'))
          ],
        ),
      ),
    );
  }

  @override
  void showSnackBar({String title = "", String message = ""}) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.black45,
      barBlur: 8.0,
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
      duration: Duration(seconds: 2),
    );
  }

  @override
  void showErrorSnackBar({String title = "", String message = ""}) {
    Get.snackbar(title, message,
        backgroundColor: Color(0x8AD32F2F),
        barBlur: 10.0,
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
        duration: Duration(seconds: 2),
        icon: Icon(Icons.error, color: Colors.white));
  }

  @override
  void showSuccessSnackBar({String title = "", String message = ""}) {
    Get.snackbar(title, message,
        backgroundColor: Color(0x8A2E7D32),
        barBlur: 10.0,
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
        duration: Duration(seconds: 2),
        icon: Icon(Icons.check_circle, color: Colors.white));
  }

  @override
  void showSimpleSnackBar({String message = ""}) {
    Get.showSnackbar(GetBar(
      messageText: Text(message, style: TextStyle(color: Colors.white)),
      duration: Duration(seconds: 2),
    ));
  }

  @override
  void showSimpleErrorSnackBar({String message = ""}) {
    Get.showSnackbar(GetBar(
      backgroundColor: Colors.red,
      icon: Icon(Icons.error, color: Colors.white),
      messageText: Text(message, style: TextStyle(color: Colors.white)),
      duration: Duration(seconds: 3),
    ));
  }

  @override
  void showSimpleSuccessSnackBar({String message = ""}) {
    Get.showSnackbar(GetBar(
      backgroundColor: Colors.green,
      icon: Icon(Icons.check_circle, color: Colors.white),
      messageText: Text(message, style: TextStyle(color: Colors.white)),
      duration: Duration(seconds: 3),
    ));
  }

  @override
  void hideDialog() {
    if (Get.isDialogOpen!) Get.back();
  }

  @override
  void showLoadingDialog() {
    Get.dialog(
        Material(
          color: Colors.black26,
          child: Center(
            child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0)),
                child: CircularProgressIndicator()),
          ),
        ),
        barrierDismissible: false,
        name: "Loading Dialog");
  }

  @override
  void showAlert(
      {String title = "Alert",
      TextStyle? titleStyle,
      Widget? content,
      required VoidCallback onConfirm,
      required VoidCallback onCancel,
      VoidCallback? onCustom,
      Color? cancelTextColor,
      Color? confirmTextColor,
      required String textConfirm,
      required String textCancel,
      String? textCustom,
      Widget? confirm,
      Widget? cancel,
      Widget? custom,
      Color? backgroundColor,
      bool barrierDismissible = true,
      Color? buttonColor,
      String middleText = "Dialog made in 3 lines of code",
      TextStyle? middleTextStyle,
      double radius = 20.0,
      List<Widget>? actions,
      required WillPopCallback onWillPop}) {
    Get.defaultDialog(
        title: title,
        titleStyle: titleStyle,
        content: content,
        onConfirm: onConfirm,
        onCancel: onCancel,
        onCustom: onCustom,
        cancelTextColor: cancelTextColor,
        confirmTextColor: confirmTextColor,
        textConfirm: textConfirm,
        textCancel: textCancel,
        textCustom: textCustom,
        confirm: confirm,
        cancel: cancel,
        custom: custom,
        backgroundColor: backgroundColor,
        barrierDismissible: barrierDismissible,
        buttonColor: buttonColor,
        middleText: middleText,
        middleTextStyle: middleTextStyle,
        radius: radius,
        actions: actions,
        onWillPop: onWillPop);
  }
}

abstract class _CommonPagesInterface {
  void showSnackBar({String title = "", String message = ""});

  void showErrorSnackBar({String title = "", String message = ""});

  void showSuccessSnackBar({String title = "", String message = ""});

  void showSimpleSnackBar({String message = ""});

  void showSimpleErrorSnackBar({String message = ""});

  void showSimpleSuccessSnackBar({String message = ""});

  void showLoadingDialog();

  void showAlert(
      {String title = "Alert",
      TextStyle? titleStyle,
      Widget? content,
      required VoidCallback onConfirm,
      required VoidCallback onCancel,
      VoidCallback? onCustom,
      Color? cancelTextColor,
      Color? confirmTextColor,
      required String textConfirm,
      required String textCancel,
      String? textCustom,
      Widget? confirm,
      Widget? cancel,
      Widget? custom,
      Color? backgroundColor,
      bool barrierDismissible = true,
      Color? buttonColor,
      String middleText = "Dialog made in 3 lines of code",
      TextStyle? middleTextStyle,
      double radius = 20.0,
      List<Widget>? actions,
      required WillPopCallback onWillPop});

  void hideDialog();
}

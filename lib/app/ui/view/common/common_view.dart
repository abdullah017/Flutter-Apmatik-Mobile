// ignore_for_file: must_be_immutable

import 'package:apmatik_app/app/core/base/base_view.dart';
import 'package:apmatik_app/app/ui/view/common/common_controller.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class CommonView extends BaseView<CommonController> {
  String? status = Get.arguments;

  @override
  Widget vBuilder() => status == "0"
      ? commonPages.registerSuccess(buttonText: 'Giriş Yap', onPressed: () {})
      : status == "1"
          ? commonPages.registerSuccess(
              buttonText: 'TEKRAR DENE', onPressed: () {})
          : status == "2"
              ? commonPages.registerSuccess(
                  buttonText: 'KABUL ETMİYORUM', onPressed: () {})
              : commonPages.registerSuccess(
                  buttonText: 'ÇIK GİR YAP', onPressed: () {});
}

import 'package:apmatik/app/core/base/base_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ReportController extends BaseController {
  GlobalKey<FormState> reportFormKey = GlobalKey();

  List<String> joblist = [
    "Uygulama",
    "Diğer",
  ].obs;

  sendReport() {
    if (reportFormKey.currentState!.validate()) {
    } else {}
  }

  @override
  void onInit() {
    super.onInit();
  }
}

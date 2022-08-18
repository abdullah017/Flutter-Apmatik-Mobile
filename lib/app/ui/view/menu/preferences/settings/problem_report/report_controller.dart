import 'package:apmatik/app/core/base/base_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ReportController extends BaseController {
  @override
  // PAGE TITLE AREA IS HERE!
  String? get pageTitle => 'languageSettings'.tr;
  // NOTICE HERE THAT THE PAGE IS A MENU ITEM TO CHANGE THE APPBAR
  @override
  bool? get isPageMenuItem => true;
  @override
  bool? get isSettingItem => true;
  GlobalKey<FormState> reportFormKey = GlobalKey();

  TextEditingController nameSurnameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

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
    nameSurnameController;
    descriptionController;
  }
}

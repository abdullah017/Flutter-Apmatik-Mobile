import 'package:apmatik/app/core/base/base_view.dart';
import 'package:flutter/cupertino.dart';

class UpdatePasswordController extends BaseController {
  TextEditingController oldPassController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController reNewPassController = TextEditingController(); 

  @override
  void onInit() {
    super.onInit();
    oldPassController;
    newPassController;
    reNewPassController;
  }

  @override
  void onClose() {
    super.onClose();
    oldPassController;
    newPassController;
    reNewPassController;
  }
}

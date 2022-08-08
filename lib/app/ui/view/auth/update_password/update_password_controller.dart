import 'package:apmatik/app/core/base/base_view.dart';
import 'package:flutter/cupertino.dart';

class UpdatePasswordController extends BaseController {
  GlobalKey<FormState> updatePasswordFormKey = GlobalKey<FormState>();

  TextEditingController oldPassController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController reNewPassController = TextEditingController();

  updatePassword() {
    if (!updatePasswordFormKey.currentState!.validate()) {
      print('ŞİFRE DEĞİŞTİRME BAŞARISIZ');
    } else {
      print('ŞİFRE DEĞİŞTİRME BAŞARILI');
    }
  }

  @override
  void onInit() {
    super.onInit();
    tabIndex = 4;
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

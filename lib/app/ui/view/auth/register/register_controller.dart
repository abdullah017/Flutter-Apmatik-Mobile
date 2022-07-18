import 'package:apmatik_app/app/core/base/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class RegisterController extends BaseController {
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  RxBool isPasswordHidden = true.obs;
  RxBool isRePasswordHidden = true.obs;
  RxString error = "Lütfen numaranızı doğru girin.".obs;
  RxBool correctPhone = false.obs;
  PhoneNumber? phoneNumberWithRegion;

  String? selectedValue = 'Erkek';
  List<String> listOfValue = ['Erkek', 'Kadın'];

  TextEditingController nameSurnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController identifyNumberController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();

  AutovalidateMode formValidation = AutovalidateMode.disabled;

  @override
  void onInit() {
    super.onInit();
    isPasswordHidden;
    nameSurnameController;
    identifyNumberController;
    phoneNumberController;
    emailController;
    passwordController;
    phoneNumberWithRegion;
  }

  void changePasswordShowStatus() {
    isPasswordHidden.value = !isPasswordHidden.value;
    print(isPasswordHidden.value);
    update();
  }

  void changeRePasswordShowStatus() {
    isRePasswordHidden.value = !isRePasswordHidden.value;
    print(isRePasswordHidden.value);
    update();
  }

  void register() async {
    if (registerFormKey.currentState!.validate()) {
      formValidation = AutovalidateMode.disabled;
      await box
          .write('userData', [
            nameSurnameController.text,
            emailController.text,
            identifyNumberController.text,
            phoneNumberWithRegion,
            selectedValue,
            passwordController.text,
          ])
          .whenComplete(() => goDetailPage())
          .catchError((err) {
            print('Error: $err'); // Prints 401.
          });
      print('YES');

      print('USER DATA => ${box.read('userData')}');
      print(box.getValues());
    } else {
      print('NO');
      formValidation = AutovalidateMode.always;
      update();
    }
  }

  void goDetailPage() {
    Get.toNamed('additional_details');
  }

  @override
  void onClose() {
    super.onClose();
    nameSurnameController;
    identifyNumberController;
    phoneNumberController;
    emailController;
    passwordController;
    repasswordController;
  }
}

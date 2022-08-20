import 'package:apmatik/app/core/base/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class RegisterController extends BaseController {
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  RxBool isPasswordHidden = true.obs;
  RxBool isRePasswordHidden = true.obs;
  RxString error = "".obs;
  RxBool correctPhone = false.obs;
  PhoneNumber? phoneNumberWithRegion;

  RxBool validForm = false.obs;
    RxBool showhideErrorMessage = true.obs;
  var langStorage = 0;
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
    langStorage = box.read('languages') ?? 0;
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
    if (registerFormKey.currentState!.validate() && validForm.value == true) {
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
          .whenComplete(() => goOtp())
          .catchError((err) {
            print('Error: $err');
          });
      print('YES');

      print('USER DATA => ${box.read('userData')}');
      print(box.getValues());
    } else {
      print('NO');
      formValidation = AutovalidateMode.always;
      //error.value = 'Lütfen Telefon Numaranızı Doğru şekilde Girin';
      validForm.value = true;
      update();
    }
  }

  void goOtp() {
    Get.toNamed('otp');
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

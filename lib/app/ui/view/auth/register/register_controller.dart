import 'package:apmatik_app/app/core/base/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class RegisterController extends BaseController {
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  RxBool isPasswordHidden = true.obs;
  RxBool isRePasswordHidden = true.obs;
  RxString error = "".obs;
  RxBool correctPhone = false.obs;

  String? selectedValue = 'Erkek';
  List<String> listOfValue = ['Erkek', 'Kadın'];

  TextEditingController nameSurnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController identifyNumberController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();
  PhoneNumber? phoneNumberWithRegion;

  @override
  void onInit() {
    super.onInit();
    isPasswordHidden;
    nameSurnameController;
    identifyNumberController;
    phoneNumberController;
    emailController;
    passwordController;
  }

  getRegionPhoneNumber() async {
    phoneNumberWithRegion = await PhoneNumber.getRegionInfoFromPhoneNumber(
        phoneNumberController.text, phoneNumberWithRegion!.dialCode!);

    print(phoneNumberWithRegion);
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
      await getRegionPhoneNumber();

      await box
          .write('userData', [
            nameSurnameController.text,
            emailController.text,
            identifyNumberController.text,
            phoneNumberWithRegion!.phoneNumber,
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

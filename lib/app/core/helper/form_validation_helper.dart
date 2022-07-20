import 'package:apmatik_app/app/core/helper/extension/form_validation_extension.dart';

import 'package:get/get.dart';

class FormValidationHelper {
  RxBool isValidate = false.obs;

  nameSurnameValidator(String nameSurname) {
    return nameSurname.validateNameAndSurname(nameSurname);
  }

  emailValidator(String email) {
    return email.validateEmail(email);
  }

  passwordValidator(String password) {
    return password.validatePassword(password);
  }

  rePasswordValidator(String confirmPass, String password) {
    return password.validateReTypePassword(confirmPass, password);
  }

  phoneNumberValidator(String phoneNumber) {
    return phoneNumber.validatePhoneNumber(phoneNumber);
  }

  IdentificationNumber(String idNumber) {
    return idNumber.validateIdentifyNumber(idNumber);
  }

  apartmenName(String apartmenName) {
    return apartmenName.validateApartmenName(apartmenName);
  }
  // validatePassword(password) {
  //   if (password!.isEmpty) {
  //     isValidate.value = false;
  //     return 'Bu alanı boş bırakmayın!';
  //   }
  //   if (password!.validatePassword) {
  //     isValidate.value = false;
  //     return 'Geçersiz şifre!';
  //   } else {
  //     isValidate.value = true;
  //     return null;
  //   }
  // }

}

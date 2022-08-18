import 'package:apmatik/app/core/constant/regexp_constants.dart';
import 'package:get/get.dart';

extension StringValidatorExtensions on String {
  RxBool get isValidAlpha => RegExpConstans.instance!.alpha.hasMatch(this).obs;
  RxBool get isValidNumeric =>
      RegExpConstans.instance!.numeric.hasMatch(this).obs;
  RxBool get isValidAlphaNumeric =>
      RegExpConstans.instance!.alphaNumeric.hasMatch(this).obs;
  RxBool get isValidName => RegExpConstans.instance!.nameExp.hasMatch(this).obs;
  RxBool get isValidEmail =>
      RegExpConstans.instance!.emailExp.hasMatch(this).obs;
  RxBool get isValidPhoneNumber =>
      RegExpConstans.instance!.phoneExp.hasMatch(this).obs;
//  RxBool getisValidBirthDate =>
//       RegExpConstans.instance!.birthDate.hasMatch(this).obs;

  ///  Adı soyadı giriş alanı için [Onaylama] kontrolü
  String? validateNameAndSurname(String? value) {
    if (value == null || value.isEmpty) {
      return 'Lütfen Ad Soyad alanını doldurun.';
      //
    }
    if (value.length < 4 || value.length > 50 || !value.isValidName.value) {
      return 'Adınız 4-50 karakter olabilir. Adınız a-z ve boşluk içerebilir.';
    }
    return null;
  }

  ///  E-posta giriş alanı için [Onaylama] kontrolü
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty || value == '') {
      print(value);
      return 'Lütfen E-Posta adresi alanını doldurun.';
      //
    }
    if (!value.isValidEmail.value) {
      print(value);
      return 'Lütfen doğru bir eposta adresi yazınız.';
      //Lütfen e-postanı dikkatlice kontrol et.
      // Lütfen e-posta adresine bir "@" işareti ekleyin. "$_email" adresinde "@" eksik.
    }
    return null;
  }

  ///  Telefon giriş alanı için [Onaylama] kontrolü
  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Lütfen cep telefonu alanını doldurun.';
      //
    }
    if (!value.isValidPhoneNumber.value) {
      return 'Lütfen doğru bir cep telefonu numarası yazınız.';
    }
    return null;
  }

  // ///  Doğum Tarihi giriş alanı için [Onaylama] kontrolü
  // RxString? validateBirthDate(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Lütfen doğum tarihi alanını doldurun.'.obs;
  //     //
  //   }
  //   if (!value.isValidBirthDate) {
  //     return 'Lütfen doğru bir doğum tarihi yazınız.';
  //   }
  //   return null;
  // }

  /// Şifre giriş alanı için [Onaylama] kontrolü
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Lütfen şifre alanını doldurun.';
      //
    }
    if (value.length < 6 || value.length > 12) {
      return 'Şifreniz en az 6, en fazla 16 karakter olabilir.';
    }
    if (!value.isValidAlphaNumeric.value) {
      return 'Şifreniz sadece harf(Türkçe hariç) ve rakam içerebilir.';
    }
    return null;
  }

  String? validateReTypePassword(String? confirmPassword, String? password) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Lütfen şifre alanını doldurun.';
      //
    }
    if (confirmPassword.length < 6 || confirmPassword.length > 12) {
      return 'Şifreniz en az 6, en fazla 16 karakter olabilir.';
    }
    if (!confirmPassword.isValidAlphaNumeric.value) {
      return 'Şifreniz sadece harf(Türkçe hariç) ve rakam içerebilir.';
    }
    if (password != confirmPassword) {
      return 'Şifreler eşleşmiyor';
    }
    return null;
  }

  /// TC Kimlik Numarası alanı için [Onaylama] kontrolü
  String? validateIdentifyNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Lütfen TC Kimlik Numarası alanını doldurun.';
      //
    }
    if (value.length < 11 || value.length > 12) {
      return 'TC Kimlik Numaranızı lütfen eksiksiz girin. ';
    }
    if (!value.isValidNumeric.value) {
      return 'TC Kimlik Numaranız sadece rakam içerebilir.';
    }
    return null;
  }

  ///  Apartman Adı giriş alanı için [Onaylama] kontrolü
  String? validateApartmenName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Lütfen Apartman adı alanını doldurun.';
      //
    }
    if (value.length < 5 || value.length > 50 || !value.isValidName.value) {
      return 'Apartman Adınız 5-50 karakter olabilir. Adınız a-z ve boşluk içerebilir.';
    }
    return null;
  }

  ///  Null yada Boş mu?
  String? validateEmptyOrNull(String? value) {
    if (value == null || value.isEmpty) {
      return 'Lütfen bu boş alanı doldurun.';
    } else {
      return null;
    }
  }
}

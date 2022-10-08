class RegExpConstans {
  static RegExpConstans? _instance;
  static RegExpConstans? get instance {
    _instance ??= RegExpConstans._init();
    return _instance;
  }

  RegExpConstans._init();

  /// Sadece Küçük-Büyük [Harf] içerebilir [a-zA-Z0-9ğüşöçİĞÜŞÖÇ]+$
  final alpha = RegExp(r'^[A-Za-zğüşöçİĞÜŞÖÇ]+$');

  /// Sadece [Rakam] içerebilir
  final numeric = RegExp(r'^-?[0-9]+$');

  /// Sadece [Alfa Numerik] => Harf yada Rakam içerebilir
  final alphaNumeric = RegExp(r'^[a-zA-Z0-9ğüşöçİĞÜŞÖÇ]+$');

  /// Sadece [Harf ve Boşluk] içerebilir
  final nameExp = RegExp(r'^[a-zA-Z0-9 ğüşöçıİĞÜŞÖÇ]+$');

  /// E-posta
  final emailExp = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

  /// Cep Telefonu Numarası
  final phoneExp = RegExp(
      r'^(?:(?:\+?1\s*(?:[.-]\s*)?)?(?:\(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\s*\)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?)?([2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})(?:\s*(?:#|x\.?|ext\.?|extension)\s*(\d+))?$');

  /////
  final birthDate =
      RegExp(r'^([0-2][0-9]|(3)[0-1])(\/)(((0)[0-9])|((1)[0-2]))(\/)\d{4}$');

  ///CREDIT CARD NUMBER
  final creditCardNumber = RegExp(r'^\d{4}(?:\s?\d{4}){3}$');

  //^4[0-9]{6,}$
}

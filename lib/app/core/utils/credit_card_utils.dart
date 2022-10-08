class CrediCardUtils {
  static String? validateDate(String? value) {
    int year;
    int month;
    if (value!.isNotEmpty) {
      if (value.contains(RegExp(r'(/)'))) {
        var split = value.split(RegExp(r'(/)'));

        month = int.parse(split[0]);
        year = int.parse(split[1]);
      } else {
        month = int.parse(value.substring(0, (value.length)));
        year = -1; // Lets use an invalid year intentionally
      }
      if ((month < 1) || (month > 12)) {
        // A valid month is between 1 (January) and 12 (December)
        return 'Expiry month is invalid';
      }
      var fourDigitsYear = convertYearTo4Digits(year);
      if ((fourDigitsYear < 1) || (fourDigitsYear > 2099)) {
        // We are assuming a valid should be between 1 and 2099.
        // Note that, it's valid doesn't mean that it has not expired.
        return 'Geçersiz Tarih';
      }
      if (!hasDateExpired(month, year)) {
        return "Geçersiz Tarih";
      }
    } else {
      return "Lütfen Son Kullanma Tarihini boş bırakmayın";
    }

    return null;
  }

  static int convertYearTo4Digits(int year) {
    if (year < 100 && year >= 0) {
      var now = DateTime.now();
      String currentYear = now.year.toString();
      String prefix = currentYear.substring(0, currentYear.length - 2);
      year = int.parse('$prefix${year.toString().padLeft(2, '0')}');
    }
    return year;
  }

  static bool hasDateExpired(int month, int year) {
    return isNotExpired(year, month);
  }

  static bool isNotExpired(int year, int month) {
    // It has not expired if both the year and date has not passed
    return !hasYearPassed(year) && !hasMonthPassed(year, month);
  }

  static List<int> getExpiryDate(String value) {
    var split = value.split(RegExp(r'(/)'));
    return [int.parse(split[0]), int.parse(split[1])];
  }

  static bool hasMonthPassed(int year, int month) {
    var now = DateTime.now();
    // The month has passed if:
    // 1. The year is in the past. In that case, we just assume that the month
    // has passed
    // 2. Card's month (plus another month) is more than current month.
    return hasYearPassed(year) ||
        convertYearTo4Digits(year) == now.year && (month < now.month + 1);
  }

  static bool hasYearPassed(int year) {
    int fourDigitsYear = convertYearTo4Digits(year);
    var now = DateTime.now();
    // The year has passed if the year we are currently is more than card's
    // year
    return fourDigitsYear < now.year;
  }

  static String? validateCardNumWithLuhnAlgorithm(String input) {
    if (input.isEmpty) {
      return 'Lütfen boş bırakmayın';
    }

    if (input.length < 8) {
      // No need to even proceed with the validation if it's less than 8 characters
      return 'Kart numarası Geçerli Değil';
    }

    int sum = 0;
    int length = input.length;
    for (var i = 0; i < length; i++) {
      // get digits in reverse order
      int digit = int.parse(input[length - i - 1]);

      // every 2nd number multiply with 2
      if (i % 2 == 1) {
        digit *= 2;
      }
      sum += digit > 9 ? (digit - 9) : digit;
    }

    if (sum % 10 == 0) {
      return null;
    }

    return 'Numara Geçerli Değil';
  }
}

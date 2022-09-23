// ignore_for_file: unnecessary_null_comparison, unused_local_variable, unnecessary_brace_in_string_interps

import 'dart:developer';
import 'dart:io';

import 'package:apmatik/app/core/constant/string_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:package_info/package_info.dart';
import 'package:url_launcher/url_launcher_string.dart';

///
/// --------------------------------------------
/// There are many amazing [Function]s in this class.
/// Especialy in [Function]ality.
/// You can find and use on your Controller wich is the Controller extends [BaseController].
class Utilities {
  void callPhoneNumber({String phone = "0"}) async {
    launchUrlString("tel://${phone}");
  }

  void intentOpenUrl({String link = "https://google.com"}) async {
    final url = link;
    if (await canLaunchUrlString(url)) {
      await canLaunchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  String moneyFormater(String value) {
    if (value == null || value == 'null') {
      value = "0";
    }

    double amount = double.parse(value);
    // FlutterMoneyFormatter fmf = FlutterMoneyFormatter(amount: amount);
    // String c = fmf.output.nonSymbol.toString().replaceAll(".00", "");
    // String fix = "" + c.replaceAll(",", ".");
    return value;
  }

  String formattedDate({required String format, required String date}) {
    if (date == 'null') {
      return "";
    }

    DateFormat dateFormat = DateFormat(format);
    DateTime dateTime = dateFormat.parse(date);

    String formattedDate = DateFormat('dd MMMM yyyy').format(dateTime);
    return formattedDate;
  }

  String formattedDateGetDay({required String format, required String date}) {
    if (date == 'null') {
      return "";
    }

    DateFormat dateFormat = DateFormat(format);
    DateTime dateTime = dateFormat.parse(date);

    String formattedDate = DateFormat('EEEE').format(dateTime);
    switch (formattedDate) {
      case "Monday":
        formattedDate = "Senin";
        break;
      case "Tuesday":
        formattedDate = "Selasa";
        break;
      case "Wednesday":
        formattedDate = "Rabu";
        break;
      case "Thursday":
        formattedDate = "Kamis";
        break;
      case "Friday":
        formattedDate = "Jum'at";
        break;
      case "Saturday":
        formattedDate = "Sabtu";
        break;
      case "Sunday":
        formattedDate = "Minggu";
        break;
    }

    return formattedDate;
  }

  String formattedDateGetMonth({required String format, required String date}) {
    if (date == 'null') {
      return "";
    }

    DateFormat dateFormat = DateFormat(format);
    DateTime dateTime = dateFormat.parse(date);

    String formattedDate = DateFormat('MMMM').format(dateTime);
    switch (formattedDate) {
      case "January":
        formattedDate = "Jan";
        break;
      case "February":
        formattedDate = "Feb";
        break;
      case "March":
        formattedDate = "Mar";
        break;
      case "April":
        formattedDate = "April";
        break;
      case "May":
        formattedDate = "May";
        break;
      case "June":
        formattedDate = "Jun";
        break;
      case "July":
        formattedDate = "Jul";
        break;
      case "August":
        formattedDate = "Aug";
        break;
      case "September":
        formattedDate = "Sept";
        break;
      case "October":
        formattedDate = "Oct";
        break;
      case "November":
        formattedDate = "Nov";
        break;
      case "December":
        formattedDate = "Dec";
        break;
    }

    return formattedDate;
  }

  String formattedSimpleDate({required String format, required String date}) {
    if (date == 'null') {
      return "";
    }

    DateFormat dateFormat = DateFormat(format);
    DateTime dateTime = dateFormat.parse(date);

    String formattedDate = DateFormat('dd MMM yyyy').format(dateTime);
    return formattedDate;
  }

  String formattedSuperSimpleDate(
      {required String format, required String date}) {
    if (date == 'null') {
      return "";
    }

    DateFormat dateFormat = DateFormat(format);
    DateTime dateTime = dateFormat.parse(date);

    String formattedDate = DateFormat('dd MMM').format(dateTime);
    return formattedDate;
  }

  String formattedDateTimeWithDay(
      {required String format, required String date}) {
    if (date == 'null') {
      return "";
    }

    DateFormat dateFormat = DateFormat(format);
    DateTime dateTime = dateFormat.parse(date);

    String day = formattedDateGetDay(format: format, date: date);

    String formattedDate = DateFormat('dd MMMM yyyy HH:mm').format(dateTime);
    return '${day}, ${formattedDate}';
  }

  String formattedDateTime({required String format, required String date}) {
    if (date == 'null') {
      return "";
    }

    DateFormat dateFormat = DateFormat(format);
    DateTime dateTime = dateFormat.parse(date);

    String formattedDate = DateFormat('dd MMMM yyyy HH:mm').format(dateTime);
    return formattedDate;
  }

  String formattedTime({required String format, required String date}) {
    if (date == 'null') {
      return "";
    }

    DateFormat dateFormat = DateFormat(format);
    DateTime dateTime = dateFormat.parse(date);

    String formattedDate = DateFormat('HH:mm').format(dateTime);
    return formattedDate;
  }

  String formattedSimpleDateTime(
      {required String format, required String date}) {
    if (date == 'null') {
      return "";
    }

    DateFormat dateFormat = DateFormat(format);
    DateTime dateTime = dateFormat.parse(date);

    String formattedDate = DateFormat('dd MMM yyyy HH:mm').format(dateTime);
    return formattedDate;
  }

  String parseHtmlString(String htmlString) {
    // var document = parse(htmlString);
    // String parsedString = parse(document.body.text).documentElement.text;
    return htmlString;
  }

  Future<String>? getVersionApp() {
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      String appName = packageInfo.appName;
      String packageName = packageInfo.packageName;
      String version = packageInfo.version;
      String buildNumber = packageInfo.buildNumber;
      if (Platform.isAndroid) {
        return "Version $version";
      } else {
        return "Version $version";
      }
    });
    return null;
  }

  Color? colorConvert(String color) {
    color = color.replaceAll("#", "");
    if (color.length == 6) {
      return Color(int.parse("0xFF$color"));
    } else if (color.length == 8) {
      return Color(int.parse("0x$color"));
    }
    return null;
  }

  void logWhenDebug(String tag, String message) {
    if (kDebugMode) {
      log("$tag => ${message.toString()}", name: AppStrings.APP_NAME);
    }
  }
}

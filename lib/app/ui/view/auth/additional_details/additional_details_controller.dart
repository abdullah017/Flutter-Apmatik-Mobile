///[EXAMPLE] => DROPDOWNSEARCH FETCH DATA APİ
///   DropdownSearch<UserModel>(
///     dropdownSearchDecoration: InputDecoration(labelText: "Name"),
///     asyncItems: (String filter) async {
///         var response = await Dio().get(
///             "http://5d85ccfb1e61af001471bf60.mockapi.io/user",
///             queryParameters: {"filter": filter},
///         );
///         var models = UserModel.fromJsonList(response.data);
///         return models;
///     },
///     onChanged: (UserModel? data) {
///       print(data);
///     },
/// )

// ignore_for_file: unused_local_variable, prefer_typing_uninitialized_variables, avoid_print

import 'dart:io';

import 'package:apmatik/app/core/base/base_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AdditionalDetailsController extends BaseController {
  GlobalKey<FormState> additionalFormKey = GlobalKey<FormState>();

  List<String> joblist = [
    "Öğrenci",
    "Öğretmen",
    "Serbest Meslek",
    "Avukat",
    "Doktor",
    "Polis"
  ].obs;
  List<String> listOfChildValue = [
    'Çocuğum Yok',
    '1 çocuk',
    '2 çocuk',
    '3 çocuk',
    '4 çocuk',
    '5 veya daha fazla çocuk'
  ];
  var selectedDate = DateTime(2000).obs;

  var isCheck = false.obs;

  String? selectedValue = 'Evli';
  List<String> listOfValue = ['Evli', 'Bekar', 'Dul'];
  String? selectedJobValue = 'Öğrenci';
  List<String> listOfJobValue = ['Öğrenci', 'Bekar'];
  String? selectedChildValue = 'Çocuğum Yok';

  RxBool petCheck = false.obs;
  RxBool dontShowCheck = true.obs;

  TextEditingController dateText = TextEditingController();
  var parse;

  @override
  void onInit() {
    super.onInit();
    dateText.text = DateFormat("dd.MM.yyyy").format(DateTime(2000)).toString();
  }

  @override
  void onClose() {
    dateText;
  }

  //DATETIME PICKER
  void chooseDate() async {
    if (Platform.isAndroid) {
      DateTime? pickedDate = await showDatePicker(
        locale: const Locale('tr'),
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
        initialEntryMode: DatePickerEntryMode.calendar,
        initialDatePickerMode: DatePickerMode.day,
        helpText: 'Doğum Tarihini Seçiniz',
        cancelText: 'Kapat',
        confirmText: 'Onayla',
        errorFormatText: 'Enter valid date',
        errorInvalidText: 'Enter valid date range',
        fieldLabelText: 'Doğum Tarihini Giriniz',
        fieldHintText: 'Month/Date/Year',
        //selectableDayPredicate: disableDate
      );
      if (pickedDate != null && pickedDate != selectedDate.value) {
        selectedDate.value = pickedDate;
        dateText = TextEditingController(
            text:
                DateFormat("dd.MM.yyyy").format(selectedDate.value).toString());
        print(dateText);
        update();
      }
    }
    if (Platform.isIOS) {
      DateTime? chosenDateTime = await showCupertinoModalPopup(
          context: Get.context!,
          builder: (BuildContext builder) {
            return CupertinoActionSheet(
              actions: [
                Container(
                  height:
                      MediaQuery.of(Get.context!).copyWith().size.height * 0.25,
                  color: Colors.white,
                  child: CupertinoDatePicker(
                    use24hFormat: true,
                    mode: CupertinoDatePickerMode.date,
                    onDateTimeChanged: (value) {
                      selectedDate.value = value;
                      parse =
                          DateFormat('MM.dd.yyyy').format(selectedDate.value);
                    },
                    initialDateTime: selectedDate.value,
                    minimumYear: 1900,
                    maximumYear: 2222,
                  ),
                )
              ],
              cancelButton: CupertinoActionSheetAction(
                child: const Text('Tamam'),
                onPressed: () {
                  Get.close(0);
                },
              ),
            );
          });
      update();
      if (parse != null && parse != selectedDate.value) {
        dateText = TextEditingController(text: parse);
        print(dateText);
        update();
      }
    }
    update();
  }
  //DISABLE DATE
  // bool disableDate(DateTime day) {
  //   if ((day.isAfter(DateTime.now().subtract(Duration(days: 1))) &&
  //       day.isBefore(DateTime.now().add(Duration(days: 5))))) {
  //     return true;
  //   }
  //   return false;
  // }

  gostatusPage() {
    try {
      Get.toNamed('common', arguments: 'registerSuccess');
    } catch (e) {
      print(e);
    }
  }

//burada locale yazdırıyorum
  saveLocalStorage() {
    box.write(
      'additional',
      [
        dateText.text,
        selectedChildValue,
        selectedJobValue,
        selectedValue,
        petCheck.value,
        dontShowCheck.value
      ],
    );
    print(box.read('additional'));
    print(box.read('userData'));
  }
}

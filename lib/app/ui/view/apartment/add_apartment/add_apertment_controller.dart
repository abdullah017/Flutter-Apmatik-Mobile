import 'package:apmatik/app/core/base/base_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddApertmentController extends BaseController
    with GetSingleTickerProviderStateMixin {
  TabController? tabController;

  String? selectedValue = 'Türkiye';
  String? selectedCity = 'İzmir';
  String? selectedDistrict = 'Bornova';
  int toggleValue = 0;
  List<String> listOfCountry = ['Türkiye', 'Almanya'];
  List<String> listOfCitys = ['İstanbul', 'İzmir'];
  List<String> listOfDistricts = ['Tuzla', 'Bornova'];
  List<bool> isSelected = [true, false, false];

  TextEditingController apartmenNameController = TextEditingController();
  GlobalKey<FormState> addApartmenFormKey = GlobalKey<FormState>();

  void goQrPage() {
    Get.toNamed('/readqr');
    // if (addApartmenFormKey.currentState!.validate()) {
    //   //Get.toNamed('/qrcode');
    // } else {
    //   print('HATALI FORM');
    // }
  }

  tabChange(int newIndex) {
    for (int index = 0; index < isSelected.length; index++) {
      if (index == newIndex) {
        isSelected[index] = true;
        print(index); //button index no
        update();
      } else {
        isSelected[index] = false;
        print(index); //button index no
        update();
      }
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
    tabIndex = 4;
  }
}

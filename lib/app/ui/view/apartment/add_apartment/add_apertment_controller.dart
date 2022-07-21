import 'package:apmatik_app/app/core/base/base_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddApertmentController extends BaseController
    with GetSingleTickerProviderStateMixin {
  TabController? tabController;

  String? selectedValue = 'Türkiye';
  String? selectedCity = 'İzmir';
  String? selectedDistrict = 'Bornova';
  List<String> listOfCountry = ['Türkiye', 'Almanya'];
  List<String> listOfCitys = ['İstanbul', 'İzmir'];
  List<String> listOfDistricts = ['Tuzla', 'Bornova'];

  TextEditingController apartmenNameController = TextEditingController();
  GlobalKey<FormState> addApartmenFormKey = GlobalKey<FormState>();

  void goQrPage() {
    if (addApartmenFormKey.currentState!.validate()) {
      //Get.toNamed('/qrcode');
    } else {
      print('HATALI FORM');
    }
  }

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
  }
}

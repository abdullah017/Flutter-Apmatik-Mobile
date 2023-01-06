
import 'package:apmatik/app/core/base/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowPaymentsController extends BaseController {
  @override
  RxBool get navBarHide => false.obs;

  navigateAddGuest() {
    Get.toNamed('add_guestcard');
  }

  late List<ChartData> chartData;

  List<ChartData> getChartData() {
    final List<ChartData> data = [
      ChartData('Aidat', 55, Colors.orange),
      ChartData('Bina Gideri', 25, Colors.black),
      ChartData('Aydınlatma Gideri', 15, Colors.grey.shade500),
    ];
    return data;
  }

  @override
  void onInit() {
    tabIndex.value = 0;
    chartData = getChartData();
    super.onInit();
  }
}

class ChartData {
  ChartData(this.continent, this.gdp, this.color);
  final String continent;
  final int gdp;
  final Color color;
}

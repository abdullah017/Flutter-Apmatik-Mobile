import 'package:apmatik_app/app/core/base/base_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddApertmentController extends BaseController
    with GetSingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
  }
}

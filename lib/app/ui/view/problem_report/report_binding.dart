import 'package:apmatik/app/ui/view/problem_report/report_controller.dart';

import 'package:get/get.dart';

class ReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ReportController>(ReportController());
  }
}

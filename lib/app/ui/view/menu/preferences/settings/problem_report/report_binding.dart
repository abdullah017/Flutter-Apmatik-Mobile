
import 'package:apmatik/app/ui/view/menu/preferences/settings/problem_report/report_controller.dart';
import 'package:get/get.dart';

class ReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ReportController>(ReportController());
  }
}

import 'package:apmatik/app/ui/view/questionnaire_detail/questionnaire_detail_controller.dart';

import 'package:get/get.dart';

class QuestionnaireDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<QuestionnaireDetailController>(QuestionnaireDetailController());
  }
}

import 'package:apmatik/app/core/base/base_view.dart';

class QuestionnaireDetailController extends BaseController {
  List options = ['Mavi', 'Kırmızı', 'Sarı', 'Yeşil'];
  var selectedValue;
  bool? check = false;
  @override
  void onInit() {
    super.onInit();
  }
}

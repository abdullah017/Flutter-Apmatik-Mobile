import 'package:apmatik/app/core/base/base_view.dart';
import 'package:get/get.dart';

class EditProfileController extends BaseController {
  List<String> joblist = [
    "Öğrenci",
    "Öğretmen",
    "Serbest Meslek",
    "Avukat",
    "Doktor",
    "Polis"
  ].obs;

  List<String> durum = [
    "Evli",
    "Bekar",
  ].obs;
  String? selectedJobValue = 'Öğrenci';
  String? selectedDurum = 'Evli';
  bool toggle = false;
  @override
  void onInit() {
    super.onInit();
  }
}

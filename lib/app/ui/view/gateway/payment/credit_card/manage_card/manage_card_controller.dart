import 'package:apmatik/app/core/base/base_controller.dart';
import 'package:apmatik/app/core/data/local/db_helper.dart';
import 'package:apmatik/app/core/model/credit_card_model.dart';
import 'package:get/get.dart';

class ManageCardController extends BaseController {
  @override
  String? get pageTitle => 'card_selection'.tr;
  @override
  bool? get isPageMenuItem => true;
  @override
  bool? get isSettingItem => false;

  DbHelper? dbHelper;
  List<CreditCard> cardList = <CreditCard>[].obs;
  Future<List<CreditCard>>? getCardList() async {
    cardList = await dbHelper!.getCreditCards();
    update();
    return cardList;
  }

  @override
  void onInit() {
    dbHelper = DbHelper();
    super.onInit();
  }
}

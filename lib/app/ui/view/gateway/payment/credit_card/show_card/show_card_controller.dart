import 'package:apmatik/app/core/base/base_controller.dart';
import 'package:apmatik/app/core/data/local/db_helper.dart';
import 'package:apmatik/app/core/model/credit_card_model.dart';
import 'package:get/get.dart';

class ShowCardController extends BaseController {
  DbHelper? dbHelper;

  RxBool isSelected = false.obs;
  RxInt selectedCardValue = 0.obs;
  List<CreditCard> cardList = <CreditCard>[].obs;

  RxBool dontVisibleManageCardButton = false.obs;

  Future<List<CreditCard>>? getCardList() async {
    cardList = await dbHelper!.getCreditCards();
    update();
    return cardList;
  }

  handleSelectedCard(value) {
    selectedCardValue.value = value;
    update();
  }

  @override
  void onInit() {
    dbHelper = DbHelper();
    //dbHelper!.deleteTable();
    super.onInit();
  }
}

import 'package:apmatik/app/core/base/base_controller.dart';
import 'package:apmatik/app/core/constant/asset_constants.dart';
import 'package:apmatik/app/core/data/local/db_helper.dart';
import 'package:apmatik/app/core/model/credit_card_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewCardController extends BaseController {
  GlobalKey<FormState> newCardFormKey = GlobalKey<FormState>();

  TextEditingController cardHolderName = TextEditingController();
  TextEditingController cardNumber = TextEditingController();
  TextEditingController cardExpriyDate = TextEditingController();
  TextEditingController cardCvvCode = TextEditingController();
  TextEditingController threeDSecurity = TextEditingController();

  RxString cardType = ''.obs;
  RxString cardIcon = ''.obs;

  RxBool checkSaveCard = true.obs;

  DbHelper? dbHelper;
  CreditCard? creditCard;

  checkSaveCardStatus() {
    checkSaveCard.value != checkSaveCard.value;
  }

  getCardTypeFrmNumber(String input) {
    if (input.startsWith(RegExp(
        r'((5[1-5])|(222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720))'))) {
      cardType.value = 'Master';
      cardIcon.value = AppAssets.master_card;
      update();
    } else if (input.startsWith(RegExp(r'[4]'))) {
      cardType.value = 'Visa';
      cardIcon.value = AppAssets.visa_card;
      update();
    } else {
      cardType.value = 'INVALID';
    }
  }

  saveCardLocalDatabase() async {
    var cards = CreditCard(
      cardHolder: cardHolderName.text,
      cardNumber: cardNumber.text,
      cardExpriyDate: cardExpriyDate.text,
      cardCvv: cardCvvCode.text,
    );

    if (creditCard!.id == null && checkSaveCard.value == true) {
      await dbHelper!.insertCreditCard(cards);
      print(cards);
    }
    // } else {
    //  BackdropFilter(
    //   filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       buildPaymentsDetailCard(),
    //     ],
    //   ),
    // ),
    //   await dbHelper!.updateContact(creditCard!);
    // }
  }



  @override
  void onInit() {
    newCardFormKey;
    cardCvvCode;
    cardExpriyDate;
    cardHolderName;
    cardNumber;
    threeDSecurity;
    dbHelper = DbHelper();
    creditCard = CreditCard();
    super.onInit();
  }

  @override
  void dispose() {
    newCardFormKey;
    cardCvvCode;
    cardExpriyDate;
    cardHolderName;
    cardNumber;
    threeDSecurity;
    super.dispose();
  }
}

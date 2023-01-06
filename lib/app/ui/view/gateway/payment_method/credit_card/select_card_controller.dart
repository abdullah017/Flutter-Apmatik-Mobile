// ignore_for_file: avoid_print
import 'dart:ui';
import 'package:apmatik/app/core/base/base_controller.dart';
import 'package:apmatik/app/core/constant/asset_constants.dart';
import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/ui/view/gateway/payment_method/credit_card/new_card/newcard_controller.dart';
import 'package:apmatik/app/ui/widgets/custom_buttons/custom_elevated_button.dart';
import 'package:apmatik/app/ui/widgets/custom_inputs/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SelectCreditCardController extends BaseController
    with GetTickerProviderStateMixin {
  @override
  // PAGE TITLE AREA IS HERE!
  String? get pageTitle => 'payment'.tr;
  // NOTICE HERE THAT THE PAGE IS A MENU AND SETTING ITEM TO CHANGE THE APPBAR
  @override
  bool? get isPageMenuItem => true;
  @override
  bool? get isSettingItem => false;

  TextEditingController threeDSecurity = TextEditingController();
  GlobalKey<FormState> threeDSecurityFormKey = GlobalKey<FormState>();
  TabController? tab;

  var newCardController = Get.find<NewCardController>();

  RxInt tabBarIndex = 0.obs;

  void handleTabIndex(value) {
    tabBarIndex.value = value;
    print(tabBarIndex.value);
  }

  Future<void> showThreeDSecureDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: AlertDialog(
            titlePadding: const EdgeInsets.only(top: 12, left: 25, right: 25),
            insetPadding: const EdgeInsets.symmetric(horizontal: 15),
            title: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppAssets.card_icon),
                    const Spacer(),
                    Image.asset(
                      AppAssets.threed_secure,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    '3D Secure Doğrulama Kodunuz',
                    style: appTextStyle
                        .getSfProDisplayBold_h6_other(AppColors.BLACK),
                  ),
                  subtitle: Text(
                    'Bankanız tarafından cep telefonu numaranıza bir doğrulama kodu gönderilmiştir. Lütfen doğrulama kodunuzu giriniz.',
                    style:
                        appTextStyle.get_SfProRounded_Medium_H6(AppColors.GREY),
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              Form(
                key: threeDSecurityFormKey,
                child: CustomTextFormField(
                  textEditingController: threeDSecurity,
                  labelText: 'Doğrulama Kodu',
                  validator: (value) {
                    return formValidationHelper.validateEmptyOrNull(value!);
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomElevatedButton(
                width: 309,
                height: 40,
                onPressed: () {
                  if (threeDSecurityFormKey.currentState!.validate()) {
                    Get.toNamed('common', arguments: 'paymentSuccess');
                    newCardController.saveCardLocalDatabase();
                  } else {
                    'HATA';
                  }
                },
                child: const Text('Onayla'),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        );
      },
    );
  }

  checkFormState() {
    if (tabBarIndex.value == 1 &&
        newCardController.newCardFormKey.currentState!.validate()) {
      print('OKEY');
      showThreeDSecureDialog(Get.context!);
    } else if (tabBarIndex.value == 0) {
      showThreeDSecureDialog(Get.context!);
      print('PROBLEM');
    }
  }

  @override
  void onInit() {
    tab = TabController(length: 2, vsync: this);
    pageTitle;
    isPageMenuItem;
    isSettingItem;
    super.onInit();
  }
}

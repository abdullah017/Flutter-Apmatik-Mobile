import 'package:apmatik/app/core/base/base_view.dart';
import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/core/constant/padding_constants.dart';
import 'package:apmatik/app/ui/view/gateway/payment_method/credit_card/new_card/newcard_view.dart';
import 'package:apmatik/app/ui/view/gateway/payment_method/credit_card/show_card/show_card_view.dart';

import 'package:apmatik/app/ui/widgets/custom_buttons/custom_bottom_payment_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'select_card_controller.dart';

class SelectCreditCardView extends BaseView<SelectCreditCardController> {
  SelectCreditCardView({Key? key}) : super(key: key, appBarHide: false);

  @override
  Widget vBuilder() => Padding(
        padding: const EdgeInsets.only(top: 60),
        child: Stack(
          children: [
            Column(
              children: <Widget>[
                SizedBox(
                  height: Get.height * 0.050,
                ),
                buildTabBar(),
                buildTabBarView(),
              ],
            ),
            buildCustomPaymentButton(),
          ],
        ),
      );

  CustomBottomPaymentButton buildCustomPaymentButton() {
    return CustomBottomPaymentButton(
      totalDebt: '2.879,00',
      onPressed: () {
        controller.checkFormState();
        // //controller.showThreeDSecureDialog(Get.context!);
      },
    );
  }

  Expanded buildTabBarView() {
    return Expanded(
      child: TabBarView(
        controller: controller.tab,
        children: <Widget>[
          ShowCardView(),
          NewCardView(),
        ],
      ),
    );
  }

  Container buildTabBar() {
    return Container(
      height: 35,
      margin: AppPadding.guideLine,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: Colors.orange),
      ),
      child: TabBar(
        controller: controller.tab,
        indicator: BoxDecoration(
          border: Border.all(color: Colors.orange),
          color: AppColors.ORANGE,
        ),
        indicatorColor: Colors.orange,
        labelColor: AppColors.WHITE,
        unselectedLabelColor: AppColors.ORANGE,
        onTap: (value) => controller.handleTabIndex(value),
        tabs: [
          Tab(
            text: 'my_cards'.tr,
          ),
          Tab(
            text: 'new_card'.tr,
          ),
        ],
      ),
    );
  }
}

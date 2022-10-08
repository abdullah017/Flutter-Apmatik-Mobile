// ignore_for_file: must_be_immutable
import 'package:apmatik/app/core/base/base_view.dart';
import 'package:apmatik/app/core/constant/padding_constants.dart';
import 'package:apmatik/app/core/model/credit_card_model.dart';
import 'package:apmatik/app/ui/view/gateway/payment/credit_card/show_card/show_card_controller.dart';
import 'package:apmatik/app/ui/widgets/custom_buttons/custom_outline_textbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowCardView extends BaseView<ShowCardController> {
  ShowCardView({super.key});

  @override
  Widget vBuilder() => Column(
        mainAxisAlignment: controller.dontVisibleManageCardButton.value
            ? MainAxisAlignment.start
            : MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: Get.height * 0.010,
          ),
          SizedBox(
            height: Get.height * 0.005,
          ),
          FutureBuilder(
            future: controller.getCardList(),
            builder: (BuildContext context,
                AsyncSnapshot<List<CreditCard>> snapshot) {
              if (!snapshot.hasData) {
                controller.dontVisibleManageCardButton.value = true;
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.data!.isEmpty) {
                controller.dontVisibleManageCardButton.value = false;
                return Transform.translate(
                  offset: Offset(0, -Get.height * 0.090),
                  child: Center(
                    child: Text("not_register_cards".tr),
                  ),
                );
              }
              return ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: AppPadding.horizontal9,
                      child: Card(
                        color: controller.selectedCardValue.value == index
                            ? Colors.orange
                            : Colors.white,
                        child: Theme(
                          data: ThemeData(
                            unselectedWidgetColor:
                                controller.selectedCardValue.value == index
                                    ? Colors.white
                                    : Colors.orange,
                          ),
                          child: buildRadioListTile(index, snapshot),
                        ),
                      ),
                    );
                  });
            },
          ),
          SizedBox(
            height: Get.height * 0.010,
          ),
          buildManageCardButton(),
        ],
      );

  RadioListTile<int> buildRadioListTile(
      int index, AsyncSnapshot<List<CreditCard>> snapshot) {
    return RadioListTile<int>(
      toggleable: true,
      value: index,
      groupValue: controller.selectedCardValue.value,
      activeColor: Colors.white,
      title: Text(
        snapshot.data![index].cardNumber!
            .replaceAll(RegExp(r'[^\s](?=.{4})'), '*'),
        style: appTextStyle.getCreditCardFont_Size16(
          controller.selectedCardValue.value == index
              ? Colors.white
              : Colors.grey,
        ),
      ),
      onChanged: (value) {
        try {
          if (value != null) {
            controller.selectedCardValue.value = value;
            controller.update();
          }
        } catch (e) {
          print(e);
        }
      },
    );
  }

  Visibility buildManageCardButton() {
    return Visibility(
      visible: controller.dontVisibleManageCardButton.value,
      child: Padding(
        padding: AppPadding.guideLine,
        child: CustomOutlineTextButton(
          fixedSize: const Size(360, 35),
          buttonText: 'Kredi Kartlarını Yönet',
          onPressed: () {
            Get.toNamed('manage_card');
            //controller.goEditProfileView();
          },
        ),
      ),
    );
  }
}

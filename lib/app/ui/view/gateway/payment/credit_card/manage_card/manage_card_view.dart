import 'package:apmatik/app/core/base/base_view.dart';
import 'package:apmatik/app/core/constant/asset_constants.dart';
import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/core/constant/decoration_constants.dart';
import 'package:apmatik/app/core/constant/padding_constants.dart';
import 'package:apmatik/app/core/model/credit_card_model.dart';
import 'package:apmatik/app/ui/view/gateway/payment/credit_card/manage_card/manage_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ManageCardView extends BaseView<ManageCardController> {
  ManageCardView({Key? key})
      : super(key: key, appBarHide: false // false
            );

  @override
  Widget vBuilder() => Padding(
        padding: const EdgeInsets.only(top: 85.0, left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.height * 0.010,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10),
              child: Text(
                'registered_cards'.tr,
              ),
            ),
            SizedBox(
              height: Get.height * 0.020,
            ),
            FutureBuilder(
              future: controller.getCardList(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<CreditCard>> snapshot) {
                if (!snapshot.hasData) return const CircularProgressIndicator();
                if (snapshot.data!.isEmpty) {
                  return const Text("Kayıtlı kartınız bulunamadı");
                }
                return ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      CreditCard creditCard = snapshot.data![index];
                      return Padding(
                        padding: AppPadding.guideLine,
                        child: Container(
                          decoration: CustomDecoration.defaultShadow,
                          margin: const EdgeInsets.only(bottom: 10),
                          child: ListTile(
                              dense: true,
                              title: Text(
                                creditCard.cardNumber!
                                    .replaceAll(RegExp(r'[^\s](?=.{4})'), '*'),
                                style: appTextStyle.getSfProDisplayMedium_H5(
                                  AppColors.ORANGE,
                                ),
                              ),
                              trailing: GestureDetector(
                                onTap: () {
                                  controller.dbHelper!.removeCreditCard(
                                      controller.cardList[index].id!);
                                  controller.update();
                                },
                                child: SvgPicture.asset(
                                  AppAssets.delete,
                                  color: Colors.black,
                                ),
                              )),
                        ),
                      );
                    });
              },
            ),
          ],
        ),
      );
}

// ignore_for_file: must_be_immutable

import 'package:apmatik/app/core/base/base_view.dart';
import 'package:apmatik/app/core/constant/asset_constants.dart';
import 'package:apmatik/app/ui/view/staff/staff_controller.dart';
import 'package:apmatik/app/ui/widgets/custom_appbars/custom_appbar.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StaffView extends BaseView<StaffController> {
  StaffView({Key? key})
      : super(
          key: key,
          navBarHide: false, // false
        );
  @override
  Widget vBuilder() => Scaffold(
      appBar: CustomAppBar(),
      body: ListView(
        children: [
          Container(
            width: Get.width,
            height: Get.height * 0.8,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    dense: true,
                    isThreeLine: true,
                    leading: Image.asset(
                      AppAssets.appbar,
                    ),
                    title: Text('YÖNETİCİ 1'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('yönetici'),
                        Text('yönetici'),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ));
}

import 'package:apmatik/app/core/base/base_view.dart';
import 'package:apmatik/app/ui/view/menu/preferences/settings/aggrement/aggrement_controller.dart';
import 'package:apmatik/app/ui/widgets/custom_appbars/custom_appbar.dart';
import 'package:flutter/material.dart';

class AggrementView extends BaseView<AggrementController> {
  AggrementView({Key? key})
      : super(
          key: key,
          navBarHide: true, // false
        );
  @override
  Widget vBuilder() => Scaffold(
      appBar: CustomAppBar(),
      body: ListView(
        children: [
          Center(child: Text('Buraya Sözleşme maddeleri gelecek')),
        ],
      ));
}

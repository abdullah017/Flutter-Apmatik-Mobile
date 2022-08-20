import 'package:apmatik/app/core/base/base_view.dart';
import 'package:apmatik/app/ui/view/menu/preferences/settings/aggrement/aggrement_controller.dart';
import 'package:flutter/material.dart';

class AggrementView extends BaseView<AggrementController> {
  AggrementView({Key? key})
      : super(
          key: key,
      
        );
  @override
  Widget vBuilder() => ListView(
        children: [
          Center(child: Text('Buraya Sözleşme maddeleri gelecek')),
        ],
      );
}

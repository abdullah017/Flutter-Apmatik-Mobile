// ignore_for_file: must_be_immutable

import 'package:apmatik/app/core/base/base_view.dart';
import 'package:apmatik/app/ui/view/blank/blank_controller.dart';
import 'package:apmatik/app/ui/widgets/custom_appbar.dart';

import 'package:flutter/material.dart';

class AggrementView extends BaseView<BlankController> {
  @override
  Widget vBuilder() => Scaffold(
      appBar: CustomAppBar(),
      body: ListView(
        children: [
          Center(child: Text('Buraya Sözleşme maddeleri gelecek')),
        ],
      ));
}
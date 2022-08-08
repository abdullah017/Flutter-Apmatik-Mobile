// ignore_for_file: must_be_immutable

import 'package:apmatik/app/core/base/base_view.dart';
import 'package:apmatik/app/ui/view/blank/blank_controller.dart';

import 'package:flutter/material.dart';

class BlankView extends BaseView<BlankController> {
  BlankView({Key? key})
      : super(
          key: key,
          navBarHide: false, // false
        );
  @override
  Widget vBuilder() {
    return Center(
      child: Text('HELLOOO!'),
    );
  }
}

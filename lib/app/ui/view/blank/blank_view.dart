// ignore_for_file: must_be_immutable

import 'package:apmatik_app/app/core/base/base_view.dart';
import 'package:apmatik_app/app/ui/view/blank/blank_controller.dart';
import 'package:flutter/material.dart';

class BlankView extends BaseView<BlankController> {
  @override
  Widget vBuilder() => Scaffold(
        body: Center(
          child: Text('HELLOOO!'),
        ),
      );
}

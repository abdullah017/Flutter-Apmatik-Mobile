
import 'package:apmatik/app/core/base/base_view.dart';
import 'package:apmatik/app/ui/view/blank/blank_controller.dart';

import 'package:flutter/material.dart';

class BlankView extends BaseView<BlankController> {
  @override
  Widget vBuilder() => Scaffold(
        body: Center(
          child: Text('HELLOOO!'),
        ),
      );
}

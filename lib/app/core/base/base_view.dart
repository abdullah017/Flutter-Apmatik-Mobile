import 'package:apmatik_app/app/core/base/base_common_pages.dart';
import 'package:apmatik_app/app/core/helper/form_validation_helper.dart';
import 'package:apmatik_app/app/ui/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'base_controller.dart';
export 'base_controller.dart';

/// [Example]
///
/// class HomeView extends BaseView<HomeController> {
///
///   @override
///   Widget vBuilder() => Scaffold(
///     appBar: AppBar(
///       title: Text("Title"),
///     ),
///     body: Container(
///       child: Center(
///         child: Text("Hello, world",
///           style: AppThemes().textTheme.bodyText1,
///         ),
///       ),
///     ),
///   );
///
/// }
///
/// RECOMENDED FOR you'r [Screen] / [View] / [Page].
/// Please extends to your [Screen] / [View] / [Page].
/// read the [Example] above.
abstract class BaseView<T extends BaseController> extends StatelessWidget {
  BaseView({
    Key? key, 
  }) : super(key: key);

  final String? tag = null;
  final AppTextStyle appTextStyle = AppTextStyle();
  final FormValidationHelper formValidationHelper = FormValidationHelper();
  final BaseCommonPages commonPages = BaseCommonPages();

  T get controller => GetInstance().find<T>(tag: tag);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<T>(
      builder: (controller) {
        return vBuilder();
      },
    );
  }

  Widget vBuilder();
}

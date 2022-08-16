// ignore_for_file: must_be_immutable

import 'package:apmatik/app/core/constant/asset_constants.dart';
import 'package:apmatik/app/core/helper/form_validation_helper.dart';
import 'package:apmatik/app/ui/style/text_style.dart';
import 'package:apmatik/app/ui/view/menu/menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    this.navBarHide = true,
  }) : super(key: key);

  final bool navBarHide;
  final String? tag = null;
  final AppTextStyle appTextStyle = AppTextStyle();
  final FormValidationHelper formValidationHelper = FormValidationHelper();

  T get controller => GetInstance().find<T>(tag: tag);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<T>(
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: !navBarHide
              ? SafeArea(
                  minimum: EdgeInsets.symmetric(horizontal: 1),
                  bottom: false,
                  child: Container(
                    width: Get.width,
                    height: Get.width > 390 ? 49.h : 50.h,
                    child: LayoutBuilder(
                      builder: (context, constraints) => Stack(
                        children: [
                          Wrap(
                            children: [
                              BottomNavigationBar(
                                  iconSize: 32,
                                  onTap: (index) async {
                                    debugPrint(controller.tabIndex.toString());
                                    controller.tabChange(index);

                                    if (index == 0) {
                                      await Get.offAndToNamed('dashboard');
                                      Get.delete<MenuController>();
                                      controller.update();
                                    }
                                    if (index == 1) {
                                      await Get.offAndToNamed('blank');
                                      Get.delete<MenuController>();
                                      controller.update();
                                    }
                                    if (index == 2) {
                                      await Get.offAndToNamed('home');
                                      Get.delete<MenuController>();
                                      controller.update();
                                    }
                                    if (index == 3) {
                                      await Get.offAndToNamed('blank');
                                      Get.delete<MenuController>();
                                      controller.update();
                                    }
                                    if (index == 4) {
                                      await Get.offAndToNamed('menu');
                                      controller.update();
                                    }
                                    controller.update();
                                  },
                                  unselectedLabelStyle: TextStyle(fontSize: 0),
                                  unselectedFontSize: 0,
                                  // unselectedIconTheme: IconThemeData(
                                  //   size: 24,
                                  // ),
                                  selectedFontSize: 0,
                                  // selectedIconTheme: IconThemeData(
                                  //   size: 24,
                                  // ),
                                  selectedLabelStyle: TextStyle(fontSize: 0),
                                  type: BottomNavigationBarType.fixed,
                                  landscapeLayout:
                                      BottomNavigationBarLandscapeLayout.linear,
                                  unselectedItemColor: Colors.black,
                                  selectedItemColor: Colors.orange,
                                  showSelectedLabels: false,
                                  showUnselectedLabels: false,
                                  currentIndex: controller.tabIndex,
                                  items: [
                                    _bottomNavbarItem(
                                      AppAssets.card_icon,
                                      '',
                                    ),
                                    _bottomNavbarItem(
                                      AppAssets.key_icon,
                                      '',
                                    ),
                                    _bottomNavbarItem(
                                      AppAssets.home_icon,
                                      '',
                                    ),
                                    _bottomNavbarItem(
                                      AppAssets.doc_icon,
                                      '',
                                    ),
                                    _bottomNavbarItem(
                                      AppAssets.menu_icon,
                                      '',
                                    ),
                                  ]),
                            ],
                          ),
                          AnimatedPositioned(
                            bottom: 0,
                            left: constraints.maxWidth /
                                    5 *
                                    (controller
                                        .tabIndex) + //space of current index
                                (constraints.maxWidth /
                                    9) - // minimize the half of it
                                30, // minimize the width of dash
                            child: Container(
                              width: 60,
                              height: 8,
                              decoration: const BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12),
                                  )),
                            ),
                            duration: const Duration(
                              milliseconds: 500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : null,
          body: vBuilder(),
        );
      },
    );
  }

  Widget vBuilder();

  _bottomNavbarItem(String assetName, String label) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        assetName,
        width: 25.w,
        height: 22.h,
        fit: BoxFit.contain,
      ),
      activeIcon: Image.asset(
        assetName,
        width: 25.w,
        height: 22.h,
        fit: BoxFit.contain,
      ),
      label: label,
    );
  }
}

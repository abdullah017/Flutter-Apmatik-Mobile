// ignore_for_file: must_be_immutable

import 'package:apmatik/app/core/constant/asset_constants.dart';
import 'package:apmatik/app/core/helper/form_validation_helper.dart';
import 'package:apmatik/app/ui/style/text_style.dart';
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
  int current = 2;
  var tabIndex = 2.obs;
  T get controller => GetInstance().find<T>(tag: tag);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<T>(
      builder: (controller) {
        return Scaffold(
          //appBar: AppBar(title: Text(appBarTitle)),

          bottomNavigationBar: !navBarHide
              ? BottomNavigationBar(
                  onTap: (index) {
                    tabChange(index);
                    controller.update();
                    if (index == 0) {
                      Get.offAndToNamed('dashboard');
                    }
                    if (index == 1) {
                      Get.offAndToNamed('blank');
                    }
                    if (index == 2) {
                      Get.offAndToNamed('home');
                    }
                    if (index == 3) {
                      Get.offAndToNamed('blank');
                    }
                    if (index == 4) {
                      Get.offAndToNamed('menu');
                    }
                  },
                  unselectedLabelStyle: TextStyle(fontSize: 0),
                  unselectedFontSize: 0,
                  unselectedIconTheme: IconThemeData(
                    size: Get.width > 390 ? 24.sp : 24.sp,
                  ),
                  selectedFontSize: 0,
                  selectedIconTheme: IconThemeData(
                    size: Get.width > 390 ? 24.sm : 24.sm,
                  ),
                  selectedLabelStyle: TextStyle(fontSize: 0),
                  type: BottomNavigationBarType.fixed,
                  landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
                  unselectedItemColor: Colors.black,
                  selectedItemColor: Colors.orange,
                  showSelectedLabels: true,
                  showUnselectedLabels: true,
                  currentIndex: tabIndex.value,
                  items: [
                      _bottomNavbarItem(AppAssets.card_icon, ''),
                      _bottomNavbarItem(AppAssets.key_icon, ''),
                      _bottomNavbarItem(AppAssets.home_icon, ''),
                      _bottomNavbarItem(AppAssets.doc_icon, ''),
                      _bottomNavbarItem(AppAssets.menu_icon, ''),
                    ])
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
        width: 24.w,
        height: 24.h,
        fit: BoxFit.contain,
      ),
      activeIcon: Container(
        height: 24.h,
        width: 24.w,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 2, color: Colors.orange),
          ),
        ),
        child: Image.asset(assetName),
      ),
      label: label,
    );
  }

  tabChange(int index) {
    tabIndex.value = index;
    print(tabIndex.value);
  }
}

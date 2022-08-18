import 'package:apmatik/app/core/constant/asset_constants.dart';
import 'package:apmatik/app/core/constant/color_constants.dart';
import 'package:apmatik/app/core/constant/padding_constants.dart';
import 'package:apmatik/app/core/helper/form_validation_helper.dart';
import 'package:apmatik/app/ui/style/text_style.dart';
import 'package:apmatik/app/ui/view/menu/menu_controller.dart';
import 'package:apmatik/app/ui/widgets/custom_appbars/login_appbar.dart';
import 'package:apmatik/app/ui/widgets/custom_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  Size get preferredSize =>
      Get.width >= 390 ? Size.fromHeight(0.1.sw) : Size.fromHeight(0.15.sw);
  BaseView({Key? key, this.navBarHide = true, this.appBarHide = true})
      : super(key: key);

  final bool navBarHide;
  final bool appBarHide;
  final String? tag = null;
  final String? pageTitle = null;
  final AppTextStyle appTextStyle = AppTextStyle();
  final AppPadding appPadding = AppPadding();
  final FormValidationHelper formValidationHelper = FormValidationHelper();

  T get controller => GetInstance().find<T>(tag: tag);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<T>(
      builder: (controller) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: AppColors.PAGEBACKGROUND,
          bottomSheet: controller.isNotification!.value
              ? Visibility(
                  visible: controller.showBottomSheet!,
                  child: CustomBottomSheet(
                    onPressed: () {
                      controller.showBottomSheet = false;
                      controller.update();
                    },
                  ),
                )
              : null, //controller.duyuru.isNotEmpty ? CustomBottomSheet() : null,
          appBar: !appBarHide
              ? controller.isLogin
                  ? controller.isPageMenuItem!
                      ? buildBackButtonAppBar(controller.pageTitle)
                      : CustomLoginUserAppBar()
                  : buildBackButtonAppBar(controller.pageTitle)
              : null,
          bottomNavigationBar: !navBarHide
              ? Container(
                  width: Get.width,
                  height: Get.width >= 390 ? 70.h : 60.h,
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
                          bottom: 25,
                          left: constraints.maxWidth /
                                  5 *
                                  (controller
                                      .tabIndex) + //space of current index
                              (constraints.maxWidth /
                                  9) - // minimize the half of it
                              30, // minimize the width of dash
                          child: Container(
                            width: 50,
                            height: 3,
                            decoration:
                                const BoxDecoration(color: AppColors.ORANGE),
                          ),
                          duration: const Duration(
                            milliseconds: 500,
                          ),
                        ),
                      ],
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

  PreferredSizeWidget buildBackButtonAppBar(String? title) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        centerTitle: false,
        leadingWidth: 70,
        elevation: 0,
        toolbarHeight: preferredSize.height,
        title: Transform.translate(
          offset: Offset(-20, 0),
          child: Text(title ?? '',
              style: controller.isSettingItem!
                  ? AppTextStyle().get_SfPro_Medium_H6(AppColors.BLACK)
                  : AppTextStyle().getSfProDisplayBold_h6(AppColors.ORANGE)),
        ),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            padding: AppPadding.guideLine20,
            width: 24,
            height: 24,
            child: controller.isSettingItem!
                ? Image.asset(
                    AppAssets.black_back_button_icon,
                    color: AppColors.BLACK,
                  )
                : SvgPicture.asset(
                    'assets/icons/back_button.svg',
                    width: 12,
                    height: 12,
                  ),
          ),
        ),
      ),
    );
  }

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

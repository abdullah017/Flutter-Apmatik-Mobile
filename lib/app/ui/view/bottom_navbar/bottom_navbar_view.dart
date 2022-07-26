import 'package:apmatik_app/app/core/base/base_view.dart';
import 'package:apmatik_app/app/core/constant/asset_constants.dart';

import 'package:apmatik_app/app/ui/view/blank/blank_view.dart';
import 'package:apmatik_app/app/ui/view/bottom_navbar/bottom_navbar_controller.dart';
import 'package:apmatik_app/app/ui/view/dashboard/dashboard_view.dart';
import 'package:apmatik_app/app/ui/view/home/home_view.dart';
import 'package:apmatik_app/app/ui/view/menu/menu_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BottomNavbarView extends BaseView<BottomNavbarController> {
  @override
  Widget vBuilder() => Scaffold(
        bottomNavigationBar: SizedBox(
          width: Get.width,
          height: 50.h,
          child: BottomNavigationBar(
              onTap: (index) {
                controller.tabChange(index);
              },
              unselectedLabelStyle: TextStyle(fontSize: 0),
              unselectedFontSize: 0,
              unselectedIconTheme: IconThemeData(
                size: Get.width > 390 ? 24.sm : 24.sm,
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
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: controller.tabIndex.value,
              items: [
                _bottomNavbarItem(AppAssets.card_icon, ''),
                _bottomNavbarItem(AppAssets.key_icon, ''),
                _bottomNavbarItem(AppAssets.home_icon, ''),
                _bottomNavbarItem(AppAssets.doc_icon, ''),
                _bottomNavbarItem(AppAssets.menu_icon, ''),
              ]),
        ),
        body: IndexedStack(
          index: controller.tabIndex.value,
          children: [
            DashBoardView(),
            BlankView(),
            HomeView(),
            BlankView(),
            MenuView()
          ],
        ),
      );
}

_bottomNavbarItem(String assetName, String label) {
  return BottomNavigationBarItem(
    icon: Image.asset(
      assetName,
      width: 24,
      height: 24,
      fit: BoxFit.contain,
    ),
    activeIcon: Container(
      height: 35,
      width: 24,
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

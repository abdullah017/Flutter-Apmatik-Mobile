import 'package:apmatik_app/app/core/base/base_view.dart';

import 'package:apmatik_app/app/ui/view/blank/blank_view.dart';
import 'package:apmatik_app/app/ui/view/bottom_navbar/bottom_navbar_controller.dart';
import 'package:apmatik_app/app/ui/view/home/home_view.dart';

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
                size: Get.width > 390 ? 16.sm : 18.sm,
              ),
              selectedFontSize: 0,
              selectedIconTheme: IconThemeData(
                size: Get.width > 390 ? 16.sm : 18.sm,
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
                _bottomNavbarItem(Icons.credit_card, ''),
                _bottomNavbarItem(Icons.key, ''),
                _bottomNavbarItem(Icons.home, ''),
                _bottomNavbarItem(Icons.insert_page_break, ''),
                _bottomNavbarItem(Icons.menu, ''),
              ]),
        ),
        body: IndexedStack(
          index: controller.tabIndex.value,
          children: [
            BlankView(),
            BlankView(),
            HomeView(),
            BlankView(),
            BlankView(),
          ],
        ),
      );
}

_bottomNavbarItem(IconData icon, String label) {
  return BottomNavigationBarItem(
    icon: Icon(icon),
    activeIcon: Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.5, color: Colors.orange),
        ),
      ),
      child: Icon(icon),
    ),
    label: label,
  );
}

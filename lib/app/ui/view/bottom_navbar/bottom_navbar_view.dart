import 'package:apmatik_app/app/core/base/base_view.dart';

import 'package:apmatik_app/app/ui/view/blank/blank_view.dart';
import 'package:apmatik_app/app/ui/view/bottom_navbar/bottom_navbar_controller.dart';
import 'package:apmatik_app/app/ui/view/home/home_view.dart';

import 'package:flutter/material.dart';

class BottomNavbarView extends BaseView<BottomNavbarController> {
  @override
  Widget vBuilder() => Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              controller.tabChange(index);
            },
            unselectedItemColor: Colors.amber,
            selectedItemColor: Colors.red,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: controller.tabIndex.value,
            items: [
              _bottomNavbarItem(),
              _bottomNavbarItem(),
            ]),
        body: IndexedStack(
          index: controller.tabIndex.value,
          children: [
            HomeView(),
            BlankView(),
          ],
        ),
      );
}

_bottomNavbarItem() {
  return BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
      ),
      label: 'HOME');
}

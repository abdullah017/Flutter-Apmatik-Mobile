// ignore_for_file: must_be_immutable

import 'package:apmatik_app/app/core/base/base_view.dart';
import 'package:apmatik_app/app/ui/view/apertment/add_apertment_controller.dart';
import 'package:apmatik_app/app/ui/widgets/custom_appbar.dart';
import 'package:apmatik_app/app/ui/widgets/custom_elevated_button.dart';

import 'package:flutter/material.dart';

class AddApertmentView extends BaseView<AddApertmentController> {
  @override
  Widget vBuilder() => Scaffold(
      appBar: CustomAppBar(),
      body: ListView(
        children: [
          Container(
            color: Colors.red,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'APARTMAN KAYDI',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'APARTMAN KAYDI',
                    ),
                    Image.asset('assets/images/code.png')
                  ],
                ),
                CustomElevatedButton(
                  width: 148,
                  height: 30,
                  margin: EdgeInsets.zero,
                  onPressed: () {},
                  child: Text('QR Kodu Okut'),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
          Container(
            width: 250,
            height: 250,
            child: TabBar(
              unselectedLabelColor: Colors.black,
              labelColor: Colors.red,
              tabs: [
                Tab(
                  text: '1st tab',
                ),
                Tab(
                  text: '2 nd tab',
                ),
              ],
              controller: controller.tabController,
              indicatorSize: TabBarIndicatorSize.tab,
            ),
          ),
          Container(
            width: 250,
            height: 250,
            child: TabBarView(
              children: [
                Container(child: Center(child: Text('people'))),
                Text('Person')
              ],
              controller: controller.tabController,
            ),
          ),
        ],
      ));
}

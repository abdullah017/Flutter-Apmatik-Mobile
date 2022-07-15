import 'package:apmatik_app/app/core/base/base_common_pages.dart';
import 'package:apmatik_app/app/core/helper/form_validation_helper.dart';
import 'package:apmatik_app/app/core//utils/utilities.dart';
import 'package:apmatik_app/app/core/network/check_connection/check_connecition.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'base_common_widgets.dart';
import 'widget_state.dart';

///
/// --------------------------------------------
/// [Example]
///
/// class HomeController extends BaseController {
///
///   var count = 0.obs;
///
///   @override
///   void onInit() {
///     super.onInit();
///   }
///
///   void increment() => count ++;
///
/// }
///
/// RECOMENDED FOR your [Controller].
/// Please extends to your [Controller].
/// read the [Example] above.
class BaseController extends GetxController
    with
        BaseCommonWidgets,
        BaseCommonPages,
        Utilities,
        WidgetState,
        ScreenState {
  final box = GetStorage();

  bool isLoadMore = false;
  bool withScrollController = false;
  String? msg;
  ScrollController scrollController = ScrollController();
  PageController pageController = PageController();
  FormValidationHelper formValidationHelper = FormValidationHelper();
  NetworkConnectivity networkConnectivity = NetworkConnectivity.instance;

  set setEnableScrollController(bool value) => withScrollController = value;

  @override
  void onInit() {
    super.onInit();
    networkConnectivity.initialise();
    networkConnectivity.myStream.listen((source) {
      var _source = source;
      print('source $_source');
      // 1.
      switch (_source.keys.toList()[0]) {
        case ConnectivityResult.mobile:
          _source.values.toList()[0]
              ? 'Mobile: Online'
              : Get.toNamed('common', arguments: '1');
          ;
          break;
        case ConnectivityResult.wifi:
          _source.values.toList()[0]
              ? 'WiFi: Online'
              : Get.toNamed('common', arguments: '1');
          ;
          break;
        case ConnectivityResult.none:
        default:
          msg = 'Offline';
          Get.toNamed('common', arguments: '1');
      }
      // 2.
      update();
      // 3.
      // showSnackBar(
      //   title: 'HATA',
      //   message: msg!,
      // );
    });
    if (withScrollController) {
      logWhenDebug("SCROLL CONTROLLER ENABLE on ${Get.currentRoute}",
          withScrollController.toString());
      scrollController = ScrollController();
      scrollController.addListener(_scrollListener);
    }
    pageController = PageController();
  }

  void onRefresh() {}

  void onLoadMore() {}

  void _scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      if (!isLoadMore) {
        isLoadMore = true;
        update();
        onLoadMore();
      }
    }
    _innerBoxScrolled();
  }

  void _innerBoxScrolled() {
    if (scrollController.offset <= 60 && scrollController.offset > 40) {
      // if(!innerBoxIsScrolled) {
      //   innerBoxIsScrolled = true;
      //   update();
      // }
    }
    if (scrollController.offset >= 0 && scrollController.offset <= 40) {
      // if(innerBoxIsScrolled) {
      //   innerBoxIsScrolled = false;
      //   update();
      // }
    }
  }
}

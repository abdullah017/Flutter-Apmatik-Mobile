// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print

import 'package:apmatik/app/core/helper/form_validation_helper.dart';
import 'package:apmatik/app/core//utils/utilities.dart';
import 'package:apmatik/app/core/network/check_connection/check_connecition.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:new_version/new_version.dart';

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
    with BaseCommonWidgets, Utilities, WidgetState, ScreenState {
  final box = GetStorage();
  var tabIndex = 2;
  tabChange(int index) {
    tabIndex = index;
    update();
  }

  var isLogin;
  bool isLoadMore = false;
  bool withScrollController = false;
  String? msg;
  String? pageTitle;
  bool? isPageMenuItem = false;
  bool? isSettingItem = false;
  RxBool? isNotification = false.obs;
  bool? showBottomSheet = true;
  RxBool navBarHide = true.obs;
  ScrollController scrollController = ScrollController();
  PageController pageController = PageController();
  FormValidationHelper formValidationHelper = FormValidationHelper();
  StreamSubscription? connectionChangeStream;
  CheckNetworkConnection connection = CheckNetworkConnection.instance;
  set setEnableScrollController(bool value) => withScrollController = value;

  ///[Calling showAlertIfNecessary with your app's
  ///BuildContext will check if the app can be updated,
  ///and will automatically display a platform-specific alert that the user can use to go to the app store.]
  basicStatusCheck(NewVersion newVersion) {
    newVersion.showAlertIfNecessary(context: Get.context!);
  }

  ///If you want to create a custom alert or use the app version information differently, call getVersionStatus.
  ///<This will return a Future<VersionStatus> with information about the local and app store versions of the app
  advancedStatusCheck(NewVersion newVersion) async {
    final status = await newVersion.getVersionStatus();
    if (status != null) {
      debugPrint(status.releaseNotes);
      debugPrint(status.appStoreLink);
      debugPrint(status.localVersion);
      debugPrint(status.storeVersion);
      debugPrint(status.canUpdate.toString());
      newVersion.showUpdateDialog(
        context: Get.context!,
        versionStatus: status,
        dialogTitle: 'Custom Title', //=> YOUR ALERT TITLE TEXT
        dialogText: 'Custom Text', //=> YOUR ALERT DESCRIPTION TEXT
        updateButtonText:
            'Custom update button text', //=> YOUR UPDATE  TITLE TEXT
        dismissButtonText:
            'Custom dismiss button text', //=> YOUR DISMISS  TITLE TEXT
        dismissAction: () {}, //=> YOUR FUNCTION  TITLE TEXT
      );
    }
  }

  checkAppVersion() {
    /// Instantiate NewVersion manager object (Using GCP Console app as example)
    final newVersion = NewVersion(
        //iOSId: 'com.google.Vespa', //=> YOUR IOS APP ID
        //androidId: 'com.google.android.apps.cloudconsole', //=> YOUR GOOGLE APP ID
        );

    /// You can let the plugin handle fetching the status and showing a dialog,
    /// or you can fetch the status and display your own dialog, or no dialog.
    bool? simpleBehavior;
    if (simpleBehavior == true) {
      basicStatusCheck(newVersion);
    } else {
      advancedStatusCheck(newVersion);
    }
  }

  bool isOffline = false;
  void connectionChanged(dynamic hasConnection) {
    isOffline = !hasConnection;
    print(isOffline);
    update();
  }

  @override
  void onInit() {
    super.onInit();

    isLogin = box.read('isLogin') ?? false;

    ///[CHECK APP VERSION]
    // checkAppVersion();

    ///[CHECK NETWORK CONNECTION]
    //networkConnectivity.initialise();
    // ConnectionStatusSingleton connectionStatus =
    //     ConnectionStatusSingleton.getInstance();
    // connectionStatus.initialize();
    // connectionChangeStream =
    //     connectionStatus.connectionChange.listen(connectionChanged);

    // connection.checkConnectionStatus().then((value) => value!
    //     ? 'BAĞLI'
    //     : Get.toNamed('common', arguments: 'registerApartmentSuccess'));
    connection.subConnectionStatus();

    ///[SCROLL CONTROLLER]
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

// import 'package:apmatik_app/app/controller/images_list_controller.dart';
// import 'package:apmatik_app/app/controller/videos_list_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'favorite_controller.dart';

// class DashboardController extends GetxController{
//   PageController?  pageController;
//   RxInt rxIndex= 0.obs;
//   @override
//   void onInit() {
//     //  implement onInit
//     super.onInit();
//     Get.put(FavoriteController(),permanent: true);
//     Get.put(ImagesController(Get.find()));

//     Get.put(VideosController(Get.find()));
//     pageController = PageController();

//   //bottomChange(0);
//   }

//   @override
//   void onReady() {
//     // implement onReady
//     super.onReady();
//   }

//   @override
//   void onClose() {
//     //  implement onClose
//     super.onClose();

//     pageController!.dispose();
//   }

//   void bottomChange(index){
//       pageController!.jumpToPage(index);
//       rxIndex.value = index;

//   }

// }


import 'package:apmatik_app/app/core/base/base_controller.dart';
import 'package:apmatik_app/app/core/controller/favorite_controller.dart';
import 'package:apmatik_app/app/core/controller/images_list_controller.dart';
import 'package:get/get.dart';

class DashboardController extends BaseController {
  RxInt rxIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    setWiState = stateError;
    logWhenDebug('state on init', getWiState.toString());
    Get.put(FavoriteController(), permanent: true);
    Get.put(ImagesController(Get.find()));
  }

  void changeState() {
    if (wiStateIsLoading) {
      setWiState = stateError;
      logWhenDebug("STATE LOADING", wiStateIsLoading.toString());
      return;
    }
    if (wiStateIsError) {
      setWiState = stateOk;
      logWhenDebug("STATE ERROR", wiStateIsError.toString());
      return;
    }
    if (wiStateIsOK) {
      setWiState = stateLoading;
      logWhenDebug("STATE OK", wiStateIsOK.toString());

      return;
    }
  }

  void bottomChange(index) {
    pageController.jumpToPage(index);
    rxIndex.value = index;
  }
}

// ignore_for_file: overridden_fields, avoid_print

import 'package:apmatik/app/core/base/base_controller.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class SplashController extends BaseController {
  // RxString byImage = ''.obs;
  // ApiRepository apiRepository = ApiRepository(ApiBaseHelper());
  // RxInt rxIndex = 0.obs;
  // RxString id = "".obs;
  // var imagesList = List<ImagesModel>.empty(growable: true).obs;
  // Rx<ImagesModel> detailResponse = ImagesModel().obs;
  // var isLoading = true.obs;

  // var isMoreDataAvailable = true.obs;
  Map source = {ConnectivityResult.none: false};
  @override
  String? msg;
  @override
  void onInit() {
    super.onInit();
    print(Get.height);
    print(Get.width);
    // print(MediaQuery.of(Get.context!).size.height);
    // print(MediaQuery.of(Get.context!).size.width);
    getVersionApp();

    // id.value = '2014422';
    // getImagesDetails(id.value);
  }

  void goLoginPage() {
    Get.toNamed('login');
  }

  void goRegisterPage() {
    Get.toNamed('register');
  }

  // void getImagesDetails(id)async {
  //   try {
  //    await apiRepository
  //         .getImagesDetails(id)
  //         .getResponse<Response<String>>((response) {
  //       if (response.data != null) {
  //         isLoading.value = false;
  //         var resData = ImagesModel.fromJson(response.data);
  //         detailResponse.value = resData;
  //         byImage.value = resData.toString();
  //       }
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // void getByImage() async {
  //   try {
  //     isLoading.value = true;
  //     await apiRepository
  //         .getbyImage()
  //         .getResponse<Response<String>>((response) {
  //       if (response.data['id'] > 0) {
  //         print(response.data);
  //         isLoading.value = false;
  //         var imageUrl = response.data['url'];
  //         print('IMAGE URL =>> $imageUrl');
  //         if (imageUrl != null) {
  //           byImage.value = imageUrl;
  //         }
  //       }
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
}

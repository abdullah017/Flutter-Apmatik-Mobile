import 'package:get/get.dart';

class ImagesViewController extends GetxController{

  RxString imageUrl="".obs;
  @override
  void onInit() {
    //  implement onInit
    super.onInit();
    var data = Get.arguments;
    if(data!=null){
      imageUrl.value=data[0];
    }
  }

  @override
  void onReady() {
    //  implement onReady
    super.onReady();

  }


}
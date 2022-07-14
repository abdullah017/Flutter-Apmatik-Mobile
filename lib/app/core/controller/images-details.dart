

import 'package:apmatik_app/app/core/model/images.dart';
import 'package:apmatik_app/app/core/network/api-handler/api-extention.dart';
import 'package:apmatik_app/app/core/network/api-handler/api-repo.dart';
import 'package:get/get.dart';

class ImagesDetailsController extends GetxController{
  ApiRepository apiRepository;
  ImagesDetailsController(this.apiRepository);
  RxString id = "".obs;
  var isLoading = true.obs;
  Rx<ImagesModel> detailResponse = ImagesModel().obs;
  @override
  void onInit() {
    //  implement onInit
    super.onInit();
    var data = Get.arguments;
    if(data!=null){
      id.value = data[0];
      getImagesDetails(id.value);
    }
  }

  @override
  void onReady() {
    //  implement onReady
    super.onReady();

  }

  void getImagesDetails(id){

    apiRepository.getImagesDetails(id).getResponse<Response<String>>((response) {
     if(response.data!=null){
       isLoading.value=false;
       var resData = ImagesModel.fromJson(response.data);
       detailResponse.value = resData;


     }
    });
  }

}
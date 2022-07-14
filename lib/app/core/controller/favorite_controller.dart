
import 'package:apmatik_app/app/core/model/images.dart';
import 'package:apmatik_app/app/core/model/videos.dart';
import 'package:get/get.dart';


class FavoriteController extends GetxController {

  RxInt rxIndex= 0.obs;
  RxInt currentIndex= 0.obs;
  RxString favUnFav= "0".obs;
  var videoList = List<VideoListModel>.empty(growable: true).obs;
  var imagesList = List<ImagesModel>.empty(growable: true).obs;
  var isLoading = false.obs;
  var isMoreDataAvailable = true.obs;
  @override
  void onInit() {

    super.onInit();

  }
  @override
  void onReady() async {


    super.onReady();
  }

  @override
  void onClose() {}

  //get all News list
  void changeSegment(index) {
    rxIndex.value = index;
     currentIndex.value=index;
  }

}

// ignore_for_file: file_names

import 'package:apmatik/app/core/constant/api_constants.dart';
import 'package:apmatik/app/core/network/api-handler/api-extention.dart';

import 'api-handler.dart';

class ApiRepository {
  final ApiBaseHelper _apiHelper;
  ApiRepository(this._apiHelper);

  // get images list
  Future getImagesList(paramMap) async {
    return _apiHelper
        .getWithParam(ApiConstant.IMAGES_LIST, paramMap)
        .execute((response) => response);
  }

  // get video list
  Future getVideoList(paramMap) async {
    return _apiHelper
        .getWithParam(ApiConstant.VIDEOS_LIST, paramMap)
        .execute((response) => response);
  }

  // get video details
  Future getVideoDetails(id) async {
    return _apiHelper
        .getWithoutParams(ApiConstant.VIDEO_DETAILS + id)
        .execute((response) => response);
  }

  // FormData formData = new FormData.fromMap({
  //     "post_data1": value,
  //     "post_data2": value,
  //   });

  // Future postData() async {
  //   return _apiHelper
  //       .post('URL',formData)
  //       .execute((response) => response);
  // }

  // get video details
  Future getImagesDetails(id) async {
    return await _apiHelper
        .getWithoutParams(ApiConstant.PHOTOS_DETAILS + id)
        .execute((response) => response);
  }
}

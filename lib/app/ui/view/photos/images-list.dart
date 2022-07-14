// // ignore_for_file: deprecated_member_use, invalid_use_of_protected_member

// import 'package:apmatik_app/app/custom-widget/images-item.dart';
// import 'package:apmatik_app/app/view/photos/view-image-details.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../controller/images_list_controller.dart';


// class ImagesListView extends GetView<ImagesController> {
//   const ImagesListView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: context.theme.backgroundColor,
//       body: Column(
//         children: [
//           Expanded(
//             child: Obx(() {
//               if (controller.isLoading.value)
//                 return Center(
//                     child: CircularProgressIndicator(
//                   valueColor: new AlwaysStoppedAnimation<Color>(
//                       context.theme.buttonColor),
//                 ));
//               else {
//                 return ListView.builder(
//                   controller: controller.scrollController,
//                   scrollDirection: Axis.vertical,
//                   itemCount: controller.imagesList.length,
//                   itemBuilder: (context, index) {
//                     if (index == controller.imagesList.length - 1 &&
//                         controller.isMoreDataAvailable.value == true) {
//                       return Center(
//                           child: CircularProgressIndicator(
//                         valueColor: new AlwaysStoppedAnimation<Color>(
//                             context.theme.buttonColor),
//                       ));
//                     }
//                     return Obx(() {
//                       return controller.imagesList.value.isNotEmpty
//                           ? ImagesItem(
//                               favoriteUnFavoriteClick: (value) {
//                                 controller.imagesList[index].favorite = value;
//                                 if (value == "0" &&
//                                     controller.favoriteController.imagesList
//                                         .isNotEmpty) {
//                                   controller.favoriteController.imagesList
//                                       .removeWhere((item) =>
//                                           item.id ==
//                                           controller.imagesList[index].id);
//                                 } else {
//                                   controller.favoriteController.imagesList
//                                       .add(controller.imagesList[index]);
//                                 }
//                               },
//                               data: controller.imagesList[index],
//                               onPressed: (value) {
//                                 Get.to(() => ImagesView(), arguments: [
//                                   controller.imagesList[index].id.toString()
//                                 ]);
//                               },
//                             )
//                           : SizedBox();
//                     });
//                   },
//                 );
//               }
//             }),
//           )
//         ],
//       ),
//     );
//   }
// }

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:photos_app/Module/Screens/AlbumsScreen/PhotosScreen/PhotosScreenController.dart';
// import '../../../../Model/PhotosT_Model.dart';
// import '../../../../Widgets/AppBar.dart';
//
// final PhotosScreenController controller = Get.find();
//
// class PhotoScreen extends StatelessWidget {
//   final RxList<PhotosT_Model> photosArray;
//
//   const PhotoScreen({super.key, required this.photosArray});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: appBar(),
//       body: photosList(controller, photosArray),
//     );
//   }
// }
//
// Widget photosList(controller,photosArray) {
//
//   return Obx(() =>
//       controller.isLoading.value
//       ? const Center(child: CircularProgressIndicator())
//       : Column(
//           children: [
//             Expanded(
//               child:
//                ListView.separated(
//                 separatorBuilder: (BuildContext context, int index) =>
//                     const Divider(
//                   color: Colors.white,
//                 ),
//                 itemCount: photosArray.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return PhotoCard(
//                     imagePath: "${photosArray[index].url}",
//                   );
//                 },
//               ),
//             ),
//           ],
//         ));
// }
//
// class PhotoCard extends StatelessWidget {
//   final String imagePath;
//
//   const PhotoCard({
//     Key? key,
//     required this.imagePath,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 15),
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(10),
//           child: CachedNetworkImage(
//             imageUrl: imagePath,
//             placeholder: (context, url) =>
//                 const Center(child: CircularProgressIndicator()),
//             errorWidget: (context, url, error) => const Icon(Icons.error),
//             fit: BoxFit.cover,
//             height: 150,
//           ),
//         ),
//         );
//   }
// }

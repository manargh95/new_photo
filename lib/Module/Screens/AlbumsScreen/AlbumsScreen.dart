import 'package:flutter/material.dart';
import 'package:photos_app/Module/Screens/AlbumsScreen/AlbumsScreenController.dart';
import 'package:photos_app/Module/Screens/AlbumsScreen/PhotosScreen/PhotosScreen.dart';
import '../../../../Widgets/AppBar.dart';

// final AlbumScreenController controller = Get.find();

class AlbumScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Container()

      // albumsList(controller),
    );
  }
}

// Widget albumsList(controller) {
//   return Obx(() => controller.isLoading.value
//       ? const Center(child: CircularProgressIndicator())
//       : Column(
//           children: [
//             Expanded(
//               child: ListView.separated(
//                 separatorBuilder: (BuildContext context, int index) =>
//                     const Divider(
//                   color: Colors.white,
//                 ),
//                 itemCount: controller.albumsList.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return InkWell(
//                     onTap: () {
//                       controller.fetchDataById(controller.albumsList[index].id);
//                       Get.to(PhotoScreen(photosArray: controller.photosList));
//                     },
//                     child: AlbumCard(
//                       albumTitle: "${controller.albumsList[index].title}",
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ));
// }
//
// class AlbumCard extends StatelessWidget {
//   final String albumTitle;
//
//   const AlbumCard({
//     Key? key,
//     required this.albumTitle,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
//       margin: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
//       width: 70,
//       height: 120,
//       // Specify the desired height
//       decoration: BoxDecoration(
//         color: Colors.pink,
//         border: Border.all(),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(10),
//         child: Center(
//             child: Text(
//           "$albumTitle",
//           style: TextStyle(color: Colors.white),
//         )),
//       ),
//     );
//   }
// }

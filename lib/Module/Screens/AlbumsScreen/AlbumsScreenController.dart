// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:photos_app/Model/AlbumsT_Model.dart';
// import '../../../../Api/DioHelper.dart';
// import '../../../Model/PhotosT_Model.dart';
//
// class AlbumScreenController extends GetxController {
//   RxList<AlbumsT_Model> albumsList = <AlbumsT_Model>[].obs;
//   RxList<PhotosT_Model> photosList = <PhotosT_Model>[].obs;
//   RxBool isLoading = false.obs;
//
//   void fetchDataById(int id) async {
//     isLoading.value = true;
//
//     try {
//       final dio = DioHelper();
//
//       final response = await dio.get(
//           'https://jsonplaceholder.typicode.com/albums/' + '$id' + '/photos');
//       if (response.statusCode == 200) {
//         final responseData = response.data as List<dynamic>;
//         final testModels =
//         responseData.map((json) => PhotosT_Model.fromJson(json)).toList();
//         photosList.value = testModels;
//       } else {
//         print('Error');
//       }
//     } catch (error) {
//       print(error.toString());
//     } finally {
//       isLoading.value = false;
//     }
//   }
//
//   void fetchData() async {
//     isLoading.value = true;
//
//     try {
//       final dio = DioHelper();
//
//       final response = await dio.get(
//           'https://jsonplaceholder.typicode.com/albums'
//       );
//       if (response.statusCode == 200) {
//         final responseData = response.data as List<dynamic>;
//         final testModels = responseData.map((json) => AlbumsT_Model.fromJson(json)).toList();
//         albumsList.value = testModels;
//       } else {
//         print('Error');
//       }
//     } catch (error) {
//       print(error.toString());
//     } finally {
//       isLoading.value = false;
//     }
//   }
//
//   @override
//   void onInit() {
//     fetchData();
//     // addLoadMoreTrigger();
//     super.onInit();
//   }
//
//   late ScrollController scrollController = ScrollController();
//   bool stopLoadMore = false;
//   RxBool isLoadingMore = false.obs;
//
//   addLoadMoreTrigger() {
//     scrollController.addListener(() {
//       if (scrollController.position.maxScrollExtent ==
//           scrollController.position.pixels) {
//         loadMore();
//       }
//     });
//   }
//
//   loadMore() async {
//     if (stopLoadMore) return;
//     RxList<AlbumsT_Model>? tAlbums;
//     isLoadingMore.value = true;
//     update();
//     final dio = DioHelper();
//
//     try {
//       final response = await dio.get(
//           'https://jsonplaceholder.typicode.com/albums'
//       );
//       if (response.statusCode == 200) {
//         final responseData = response.data as List<dynamic>;
//         final testModels = responseData.map((json) => AlbumsT_Model.fromJson(json)).toList();
//         tAlbums = testModels.obs;
//       }
//     } catch (error) {
//       print(error.toString());
//     } finally {
//       isLoadingMore.value = false;
//     }
//
//     if (tAlbums!.isEmpty) stopLoadMore = true;
//     albumsList.addAll(tAlbums);
//
//     update();
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:photos_app/Model/CommentsT_Model.dart';
// import 'package:photos_app/Model/PostT_Model.dart';
// import '../../../Api/DioHelper.dart';
//
// class PostScreenController extends GetxController {
//   RxList<PostT_Model> postsList = <PostT_Model>[].obs;
//   RxList<CommentsT_Model> commentsList = <CommentsT_Model>[].obs;
//
//   RxBool isLoading = false.obs;
//
//   void fetchData() async {
//     isLoading.value = true;
//
//     try {
//       final dio = DioHelper();
//
//       final response =
//           await dio.get('https://jsonplaceholder.typicode.com/posts');
//       if (response.statusCode == 200) {
//         final responseData = response.data as List<dynamic>;
//         final testModels =
//             responseData.map((json) => PostT_Model.fromJson(json)).toList();
//         postsList.value = testModels;
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
//     fetchComments();
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
//     RxList<PostT_Model>? tPosts;
//     isLoadingMore.value = true;
//     update();
//     final dio = DioHelper();
//
//     try {
//       final response =
//           await dio.get('https://jsonplaceholder.typicode.com/posts');
//       if (response.statusCode == 200) {
//         final responseData = response.data as List<dynamic>;
//         final testModels =
//             responseData.map((json) => PostT_Model.fromJson(json)).toList();
//         tPosts = testModels.obs;
//       }
//     } catch (error) {
//       print(error.toString());
//     } finally {
//       isLoadingMore.value = false;
//     }
//
//     if (tPosts!.isEmpty) stopLoadMore = true;
//     postsList.addAll(tPosts);
//
//     update();
//   }
//
//   void fetchComments() async {
//     int postID =1;
//     isLoading.value = true;
//
//     try {
//       final dio = DioHelper();
//
//       final response = await dio.get(
//           'https://jsonplaceholder.typicode.com/comments',
//           queryParameters: {"postId": postID});
//       if (response.statusCode == 200) {
//         final responseData = response.data as List<dynamic>;
//         final testModels =
//             responseData.map((json) => CommentsT_Model.fromJson(json)).toList();
//         commentsList.value = testModels;
//       } else {
//         print('Error');
//       }
//     } catch (error) {
//       print(error.toString());
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }

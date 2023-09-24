import 'package:http/http.dart';

import '../../Model/CommentsT_Model.dart';
import '../../Model/PostT_Model.dart';

class Repo{
  // String url ="https://jsonplaceholder.typicode.com/";
// List<PostT_Model> postsList = <PostT_Model>[];
// List<CommentsT_Model> commentsList = <CommentsT_Model>[];


   Future<List<PostT_Model>> fetchData() async {

      Response response =
      await get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
      if (response.statusCode == 200) {
        final responseData = response as List<dynamic>;
        // final testModels =
        responseData.map((json) => PostT_Model.fromJson(json)).toList();
        // postsList = testModels;
      }
     throw Exception(response.reasonPhrase);

  }


  //  fetchComments() async {
  //   int postID =1;
  //   isLoading = true;
  //   final queryParameters = {
  //     'postId': postID,
  //   };
  //
  //
  //   try {
  //
  //     Response response =
  //     await get(Uri.https(url,'comments',queryParameters));
  //
  //     if (response.statusCode == 200) {
  //       final responseData = response as List<dynamic>;
  //       final testModels =
  //       responseData.map((json) => CommentsT_Model.fromJson(json)).toList();
  //       commentsList = testModels;
  //     } else {
  //       print('Error');
  //     }
  //   } catch (error) {
  //     print(error.toString());
  //   } finally {
  //     isLoading = false;
  //   }
  // }


}


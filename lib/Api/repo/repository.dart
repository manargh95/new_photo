import 'dart:convert';
import 'package:http/http.dart';
import '../../Config/constant/app_constant.dart';
import '../../Model/CommentsT_Model.dart';
import '../../Model/PostT_Model.dart';

class Repo {
  Future<List<PostT_Model>> fetchData() async {
    Response response = await get(Uri.parse(baseUrl + "posts"));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      print("success");
      return responseData.map((json) => PostT_Model.fromJson(json)).toList();
    } else {
      throw Exception("Failed to fetch data: ${response.reasonPhrase}");
    }
  }


  Future<List<CommentsT_Model>> fetchComments(int postID) async {

    final uri =
    Uri.parse(baseUrl+ 'comments?'+"postId=$postID");

    Response response = await get(uri);
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      print("success");
      return responseData
          .map((json) => CommentsT_Model.fromJson(json))
          .toList();
    } else {
      throw Exception("Failed to fetch data: ${response.reasonPhrase}");
    }
  }




}


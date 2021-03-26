import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:chatting/models/post_model.dart';

class PostService {
  Dio dio = new Dio();
  final String url = 'http://42f49452e798.ngrok.io/';

  /*getPosts() async {
    try {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["authorization"] =
          "Bearer " + localStorage.getString('token');
      Response response = await dio.get(
        url + 'posts',
      );
      return response.data;
    } catch (error, stackTrace) {
      print("Exception occurred: $error  stackTrace: $stackTrace");
      return error;
    }
  }*/

  Future<PostList> getPosts() async {
    try {
      final String _endpoint = url + "posts";
      Dio dio = new Dio();
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["authorization"] =
          "Bearer " + localStorage.getString('token');
      Response response = await dio.get(_endpoint);
      //print("user API response - : $response ");
      return PostList.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return error;
    }
  }
}

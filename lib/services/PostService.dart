import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:chatting/models/post_model.dart';

class PostService {
  //Dio dio = new Dio();
  final String url = 'http://fe30130e9870.ngrok.io/';

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

  /*Future getImage() async {
    File _image;
    final picker = ImagePicker();

    var _pickedFile = await picker.getImage(
        source: ImageSource.camera,
        imageQuality: 50, // <- Reduce Image quality
        maxHeight: 500, // <- reduce the image size
        maxWidth: 500);

    _image = File(_pickedFile.path);

    _upload(_image);
  }

  void _upload(File file) async {
    String fileName = file.path.split('/').last;

    FormData data = FormData.fromMap({
      "images": await MultipartFile.fromFile(
        file.path,
        filename: fileName,
      ),
    });

    Dio dio = new Dio();

    dio
        .post(url + "/posts", data: data)
        .then((response) => print(response))
        .catchError((error) => print(error));
  }*/
}

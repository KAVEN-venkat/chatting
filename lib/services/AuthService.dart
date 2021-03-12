import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthService {
  Dio dio = new Dio();
  //final String url = 'https://stocklift.herokuapp.com/';
  final String url = 'http://571485263a2d.ngrok.io/';
  getCountries() async {
    Response response = await dio.get(url + 'countries');
    return response.data;
  }

  getStates(country) async {
    Response response = await dio.get(url + 'states/' + country);
    return response.data;
  }

  getCities(country, state) async {
    Response response = await dio.get(url + 'cities/' + country + '/' + state);
    return response.data;
  }

  login(email, password) async {
    try {
      return await dio.post(url + 'users/login',
          data: {"email": email, "password": password},
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  register(firstname, lastname, mobile, email, password, country, state,
      city) async {
    try {
      return await dio.post(url + 'users/create',
          data: {
            "email": email,
            "password": password,
            "first_name": firstname,
            "last_name": lastname,
            "mobile": mobile,
            "country": country,
            "state": state,
            "city": city,
            "role": 'user',
            "login_type": 'general'
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}

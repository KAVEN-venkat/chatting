import 'package:chatting/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:chatting/constant/constant.dart';
import 'package:chatting/screens/splash.dart';
import 'package:chatting/screens/signin.dart';
import 'package:chatting/screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stocklift Inc',
      theme: ThemeData(
        primaryColor: new Color(0xff1C1C29),
        accentColor: new Color(0xff2A2B3F),
      ),
      routes: <String, WidgetBuilder>{
        splash: (BuildContext context) => AnimatedSplashScreen(),
        signin: (BuildContext context) => Signin(),
        signup: (BuildContext context) => Signup(),
        home: (BuildContext context) => Home(),
      },
      home: AnimatedSplashScreen(),
    );
  }
}

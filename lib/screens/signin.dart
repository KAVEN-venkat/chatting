import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:chatting/screens/signup.dart';
import 'package:chatting/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:chatting/services/AuthService.dart';

void main() => runApp(Signin());

class Signin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: new Color(0xffffffff),
        accentColor: new Color(0xff03569B),
      ),
      debugShowCheckedModeBanner: false,
      home: SigninScreen(),
    );
  }
}

class SigninScreen extends StatefulWidget {
  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  //double _height;
  //double _width;
  var email;
  var password;
  bool isLoading;
  final _formKey = GlobalKey<FormState>();
  final String assetName = 'assets/images/logo.svg';
  @override
  void initState() {
    super.initState();
  }

  Widget stockliftLogo() {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 35.0,
              vertical: 45.0,
            ),
            child: Container(
              alignment: Alignment.bottomCenter,
              child: kIsWeb
                  ? Image.network(assetName)
                  : SvgPicture.asset(
                      assetName,
                      height: 107.0,
                      width: 150.0,
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget loginButton() {
    return SizedBox(
      width: 160.0,
      height: 40.0,
      child: ElevatedButton(
        child: Text("Login"),
        onPressed: () {
          Navigator.of(context).pushReplacement(
            new MaterialPageRoute(builder: (BuildContext context) {
              return new Signin();
            }),
          );
        },
        style: ElevatedButton.styleFrom(
          primary: Color(0xff39CEFD),
          onPrimary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
        ),
      ),
    );
  }

  Widget signupButton() {
    return SizedBox(
      width: 160.0,
      height: 40.0,
      child: ElevatedButton(
        child: Text("Create Account"),
        onPressed: () {
          Navigator.of(context).pushReplacement(
            new MaterialPageRoute(builder: (BuildContext context) {
              return new Signup();
            }),
          );
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          onPrimary: Color(0xff39CEFD),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
        ),
      ),
    );
  }

  Widget signInTextRow() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Log In',
          style: TextStyle(
            fontSize: 20.0,
            color: Color(0xff03569B),
          ),
        ),
      ),
    );
  }

  Widget emailField() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: TextFormField(
          validator: (value) {
            if (value.isEmpty) {
              return '';
            }
            return null;
          },
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            color: Color(0xff03569B),
          ),
          decoration: InputDecoration(
            isDense: true,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            hintText: 'Email',
            hintStyle: TextStyle(
              fontSize: 16,
              color: Color(0xff03569B),
            ),
            filled: true,
            fillColor: Color(0xfff1f1f1),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            errorBorder: new OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
              borderSide: new BorderSide(color: Colors.red, width: 0.5),
            ),
            errorStyle: TextStyle(height: 0),
          ),
          onChanged: (value) {
            email = value;
          },
        ),
      ),
    );
  }

  Widget passwordField() {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: TextFormField(
          validator: (value) {
            if (value.isEmpty) {
              return '';
            }
            return null;
          },
          obscureText: true,
          style: TextStyle(
            color: Color(0xff03569B),
          ),
          decoration: InputDecoration(
            isDense: true,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            hintText: 'Password',
            hintStyle: TextStyle(
              fontSize: 16,
              color: Color(0xff03569B),
            ),
            filled: true,
            fillColor: Color(0xfff1f1f1),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            errorBorder: new OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
              borderSide: new BorderSide(color: Colors.red, width: 0.5),
            ),
            errorStyle: TextStyle(
              height: 0,
            ),
          ),
          onChanged: (value) {
            password = value;
          },
        ),
      ),
    );
  }

  Widget forgotButton() {
    return ButtonTheme(
      minWidth: 160.0,
      child: FlatButton(
        color: Color(0xffffffff),
        onPressed: () {
          print("Forgot Button Clicked!");
        },
        child: Text(
          'Forgot Password',
          style: TextStyle(
            color: Color(0xff03569B),
          ),
        ),
      ),
    );
  }

  Widget submitButton() {
    return ButtonTheme(
      minWidth: 160.0,
      child: RaisedButton(
        color: Color(0xff03569B),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        onPressed: () {
          if (_formKey.currentState.validate()) {
            login();
          }
        },
        child: Text(
          'Login',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void login() async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    AuthService().login(email, password).then((val) {
      if (val.data['status']) {
        localStorage.setString('token', val.data['token']);
        localStorage.setString(
            'user',
            val.data['users']['first_name'] +
                " " +
                val.data['users']['last_name']);
        Fluttertoast.showToast(
          msg: 'Login Success.',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => Home(),
          ),
        );
      } else {
        showToast(context, "Please check your login details.");
      }
    });
    /*if (email == 'stocklift@yopmail.com' && password == 'Test1@34') {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', 'stocklift');
      localStorage.setString('user', 'Stocklift');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => Home(),
        ),
      );
    } else {
      showToast(context, "Please check your login details.");
    }*/
    setState(() {
      isLoading = false;
    });
  }

  void showToast(BuildContext context, msg) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(msg),
        action: SnackBarAction(
            label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  void navigationPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Home()),
    );
  }

  Widget socialButton() {
    final String google = 'assets/images/social/google.svg';
    final String facebook = 'assets/images/social/facebook.svg';
    return ButtonTheme(
      child: ButtonBar(
        alignment: MainAxisAlignment.center,
        children: [
          FlatButton(
            onPressed: null,
            child:
                kIsWeb ? Image.network(facebook) : SvgPicture.asset(facebook),
          ),
          FlatButton(
            onPressed: null,
            child: kIsWeb ? Image.network(google) : SvgPicture.asset(google),
          ),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    //_height = MediaQuery.of(context).size.height;
    //_width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xfff1f1f1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            stockliftLogo(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                loginButton(),
                SizedBox(width: 10),
                signupButton(),
              ],
            ),
            SizedBox(height: 11.0),
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xffffffff),
                      ),
                      child: Column(
                        children: [
                          signInTextRow(),
                          SizedBox(height: 10),
                          emailField(),
                          SizedBox(height: 10),
                          passwordField(),
                          SizedBox(height: 5),
                          forgotButton(),
                          SizedBox(height: 5),
                          submitButton(),
                          SizedBox(height: 32),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text(
              "or continue with:",
              style: TextStyle(
                color: Color(0xff03569B),
              ),
            ),
            SizedBox(height: 10),
            socialButton(),
          ],
        ),
      ),
    );
  }
}

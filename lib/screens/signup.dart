import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:chatting/screens/signin.dart';
import 'package:chatting/screens/home.dart';
import 'package:chatting/services/AuthService.dart';

void main() => runApp(Signup());

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: new Color(0xffffffff),
        accentColor: new Color(0xff03569B),
      ),
      debugShowCheckedModeBanner: false,
      //home: SignupScreen(),
      home: LoaderOverlay(
        overlayWidget: Center(
          child: SpinKitCubeGrid(
            color: Color(0xff39CEFD),
            size: 50.0,
          ),
        ),
        overlayOpacity: 0.8,
        child: SignupScreen(),
      ),
    );
  }
}

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  //double _height;
  //double _width;
  var firstname;
  var lastname;
  var mobile;
  var email;
  var password;
  bool isLoading;
  final logo = 'assets/images/logo.svg';
  var selectedCountry;
  var selectedState;
  var selectedCity;
  List countryList = List();
  List stateList = List();
  List cityList = List();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    getCountry();
  }

  void getCountry() async {
    context.showLoaderOverlay();
    await Future.delayed(Duration(seconds: 3));
    AuthService().getCountries().then((res) => {
          setState(() {
            countryList = res;
            context.hideLoaderOverlay();
          })
        });
  }

  void states() async {
    context.showLoaderOverlay();
    await Future.delayed(Duration(seconds: 3));
    AuthService().getStates(selectedCountry).then((res) => {
          setState(() {
            stateList = res;
            context.hideLoaderOverlay();
          })
        });
  }

  void cities() async {
    context.showLoaderOverlay();
    await Future.delayed(Duration(seconds: 3));
    AuthService().getCities(selectedCountry, selectedState).then((res) => {
          setState(() {
            cityList = res;
            context.hideLoaderOverlay();
          })
        });
  }

  Widget stockliftLogo() {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 45),
            child: Container(
              alignment: Alignment.bottomCenter,
              child: kIsWeb
                  ? Image.network(logo)
                  : SvgPicture.asset(
                      logo,
                      height: 107,
                      width: 150,
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget loginButton() {
    return ButtonTheme(
      minWidth: 160.0,
      height: 40.0,
      child: RaisedButton(
        color: Color(0xffffffff),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        onPressed: () {
          print("Login Button Clicked!");
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => Signin(),
            ),
          );
        },
        child: Text(
          'Log In',
          style: TextStyle(
            color: Color(0xff39CEFD),
          ),
        ),
      ),
    );
  }

  Widget signupButton() {
    return ButtonTheme(
      minWidth: 160.0,
      height: 40.0,
      child: RaisedButton(
        color: Color(0xff39CEFD),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        onPressed: () {
          print("Create Button Clicked!");
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => Signup(),
            ),
          );
        },
        child: Text(
          'Create Account',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget signUpTextRow() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Create Account',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget firstName() {
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
          style: TextStyle(
            color: Color(0xff03569B),
          ),
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.fromLTRB(16, 10, 16, 10),
            hintText: 'First Name',
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
            firstname = value;
          },
        ),
      ),
    );
  }

  Widget lastName() {
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
          style: TextStyle(
            color: Color(0xff03569B),
          ),
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.fromLTRB(16, 10, 16, 10),
            hintText: 'Last Name',
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
            lastname = value;
          },
        ),
      ),
    );
  }

  Widget mobileNumber() {
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
          keyboardType: TextInputType.number,
          style: TextStyle(
            color: Color(0xff03569B),
          ),
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.fromLTRB(16, 10, 16, 10),
            hintText: 'Mobile',
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
            mobile = value;
          },
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
            contentPadding: EdgeInsets.fromLTRB(16, 10, 16, 10),
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
            errorStyle: TextStyle(
              height: 0,
            ),
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
            contentPadding: EdgeInsets.fromLTRB(16, 10, 16, 10),
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

  Widget confirmPasswordField() {
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
            contentPadding: EdgeInsets.fromLTRB(16, 10, 16, 10),
            hintText: 'Confirm Password',
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

  Widget country() {
    return Padding(
      //padding: const EdgeInsets.only(left: 40, right: 40, bottom: 24, top: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        height: 40.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          color: Color(0xfff1f1f1),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
              canvasColor: Color(0xfff1f1f1),
              buttonTheme: ButtonTheme.of(context).copyWith(
                alignedDropdown: true,
              )),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              isExpanded: true,
              value: selectedCountry,
              hint: Text(
                'Country',
                style: TextStyle(
                  color: Color(0xff03569B),
                  fontSize: 16.0,
                ),
              ),
              items: countryList.map((country) {
                return new DropdownMenuItem(
                  value: country['shortName'],
                  child: new Text(
                    country['name'],
                    style: TextStyle(
                      color: Color(0xff03569B),
                      fontSize: 16.0,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (val) {
                print(val);
                setState(() {
                  selectedCountry = val;
                });
                states();
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget state() {
    return Padding(
      //padding: const EdgeInsets.only(left: 40, right: 40, bottom: 24, top: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        height: 40.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          color: Color(0xfff1f1f1),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
              canvasColor: Color(0xfff1f1f1),
              buttonTheme: ButtonTheme.of(context).copyWith(
                alignedDropdown: true,
              )),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              isExpanded: true,
              value: selectedState,
              hint: Text(
                'State',
                style: TextStyle(
                  color: Color(0xff03569B),
                  fontSize: 16.0,
                ),
              ),
              items: stateList.map((state) {
                return new DropdownMenuItem(
                  value: state,
                  child: new Text(
                    state,
                    style: TextStyle(
                      color: Color(0xff03569B),
                      fontSize: 16.0,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (val) {
                print(val);
                setState(() {
                  selectedState = val;
                  cities();
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget city() {
    return Padding(
      //padding: const EdgeInsets.only(left: 40, right: 40, bottom: 24, top: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        height: 40.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          color: Color(0xfff1f1f1),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
              canvasColor: Color(0xfff1f1f1),
              buttonTheme: ButtonTheme.of(context).copyWith(
                alignedDropdown: true,
              )),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              isExpanded: true,
              value: selectedCity,
              hint: Text(
                'City',
                style: TextStyle(
                  color: Color(0xff03569B),
                  fontSize: 16.0,
                ),
              ),
              items: cityList.map((city) {
                return new DropdownMenuItem(
                  value: city,
                  child: new Text(
                    city,
                    style: TextStyle(
                      color: Color(0xff03569B),
                      fontSize: 16.0,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (val) {
                print(val);
                setState(() {
                  selectedCity = val;
                });
              },
            ),
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
          // print("Signup Clicked!");
          if (_formKey.currentState.validate()) {
            signup();
          }
        },
        child: Text(
          'Signup',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void signup() async {
    setState(() {
      isLoading = true;
    });
    AuthService()
        .register(firstname, lastname, mobile, email, password, selectedCountry,
            selectedState, selectedCity)
        .then((val) {
      if (val.data['status']) {
        Fluttertoast.showToast(
          msg: 'User registration completed successfully..',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0,
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => Signin(),
          ),
        );
      }
    });
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

  Widget build(BuildContext context) {
    // _height = MediaQuery.of(context).size.height;
    // _width = MediaQuery.of(context).size.width;
    return Scaffold(
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
                          signUpTextRow(),
                          firstName(),
                          SizedBox(height: 10),
                          lastName(),
                          SizedBox(height: 10),
                          mobileNumber(),
                          SizedBox(height: 10),
                          emailField(),
                          SizedBox(height: 10),
                          passwordField(),
                          SizedBox(height: 10),
                          confirmPasswordField(),
                          SizedBox(height: 10),
                          country(),
                          SizedBox(height: 10),
                          state(),
                          SizedBox(height: 10),
                          city(),
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
          ],
        ),
      ),
    );
  }
}

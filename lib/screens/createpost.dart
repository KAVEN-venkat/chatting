import 'package:flutter/material.dart';
import 'dart:async';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:chatting/screens/home.dart';
//import 'package:chatting/services/PostService.dart';

void main() => runApp(Createpost());

class Createpost extends StatelessWidget {
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
        child: CreatepostScreen(),
      ),
    );
  }
}

class CreatepostScreen extends StatefulWidget {
  @override
  _CreatepostScreenState createState() => _CreatepostScreenState();
}

class _CreatepostScreenState extends State<CreatepostScreen> {
  //double _height;
  //double _width;
  var content;
  List<Asset> images = <Asset>[];
  String _error = 'No Error Dectected';
  final logo = 'assets/images/logo.svg';
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    getFriends();
  }

  void getFriends() async {
    print("Friends list.!");
  }

  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return AssetThumb(
          asset: asset,
          width: 300,
          height: 300,
        );
      }),
    );
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = <Asset>[];
    String error = 'No Error Detected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }
    if (!mounted) return;

    setState(() {
      images = resultList;
      _error = error;
    });
  }

  Widget postcontent() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          keyboardType: TextInputType.multiline,
          minLines: 1,
          maxLines: 8,
          validator: (value) {
            if (value.isEmpty) {
              return '';
            }
            return null;
          },
          style: TextStyle(
            color: Color(0xff03569B),
          ),
          textAlign: TextAlign.start,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            hintText: 'Write your post...',
            hintStyle: TextStyle(
              fontSize: 16,
              color: Color(0xff03569B),
            ),
            filled: true,
            fillColor: Color(0xffffffff),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.5)),
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
            content = value;
          },
        ),
      ),
    );
  }

  Widget submitPost() {
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
            createApi();
          }
        },
        child: Text(
          'Create Post',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void createApi() async {
    print("Post create api call");
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

  Widget build(BuildContext context) {
    // _height = MediaQuery.of(context).size.height;
    // _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xfff1f1f1),
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  )
                }),
        title: Text("Post Creation"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      postcontent(),
                      SizedBox(height: 10),
                      submitPost(),
                      SizedBox(height: 32),
                    ],
                  ),
                ),
              ],
            ),
          ),
          //Center(child: Text('Error: $_error')),
          /*ElevatedButton(
            child: Text("Pick images"),
            onPressed: loadAssets,
          ),
          Expanded(
            child: Row(
              children: <Widget>[buildGridView()],
            ),
          ),*/
          Expanded(
            child: Row(
              children: <Widget>[buildGridView()],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
            height: 100.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TextButton.icon(
                  onPressed: () {
                    loadAssets();
                  },
                  icon: Icon(Icons.camera, size: 18),
                  label: Text("Upload Photos"),
                ),
              ],
            )),
      ),
    );
  }
}

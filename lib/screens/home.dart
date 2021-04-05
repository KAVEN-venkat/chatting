//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:chatting/fonts/fontawesomefour_icons.dart';
import 'package:chatting/screens/tabs/post.dart';
import 'package:chatting/screens/tabs/chat.dart';
import 'package:chatting/screens/tabs/friend.dart';
import 'package:chatting/screens/tabs/settings.dart';
import 'package:chatting/screens/createpost.dart';

void main() => runApp(Home());

/// This Widget is the main application widget.
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: new Color(0xffffffff),
        accentColor: new Color(0xff03569B),
      ),
      debugShowCheckedModeBanner: false,
      home: MyNavigationBar(),
    );
  }
}

class MyNavigationBar extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyNavigationBar> {
  int tabIndex = 0;
  List<Widget> listScreens;
  @override
  void initState() {
    super.initState();
    listScreens = [
      Post(),
      Friend(),
      Chat(),
      Settings(),
    ];
  }

  Widget appBarTitle() {
    if (tabIndex == 0) {
      return Text('Hi, Venkat!');
    } else if (tabIndex == 1) {
      return Text('Friends');
    } else {
      return Text("Chat");
    }
  }

  Widget appBar() {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      title: appBarTitle(),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 16,
              backgroundColor: Color(0xfff1f1f1),
              child: IconButton(
                icon: Icon(
                  Icons.notifications,
                  color: Colors.grey,
                  size: 16,
                ),
                onPressed: null,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            CircleAvatar(
              radius: 20,
              child: ClipOval(
                child: Image(
                  width: 40.0,
                  image: Image.asset('assets/images/10.jpg').image,
                ),
              ),
            ),
            SizedBox(
              width: 19,
            )
          ],
        ),
      ],
    );
  }

  Widget searchBar() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 4,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.search, color: Colors.grey),
              Expanded(
                child: Container(
                  height: 40,
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(
                            10), //Change this value to custom as you like
                        isDense: true, // and add this line
                        hintText: 'Search',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontStyle: FontStyle.normal,
                        )),
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    maxLines: 1,
                  ),
                ),
              ),
              InkWell(
                child: Icon(
                  Icons.mic,
                  color: Colors.grey,
                ),
                onTap: () {},
              )
            ],
          ),
        ),
        Expanded(
          child: listScreens[tabIndex],
        ),
      ],
    );
  }

  Widget buttonBar() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 3,
        ),
        Container(
          //color: Color(0xfff1f1f1), // This line set the transparent background
          color: Colors.white,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Container(
              color: Colors.white,
              margin: EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.search, color: Colors.grey),
                  Expanded(
                    child: Container(
                      height: 40,
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(
                                10), //Change this value to custom as you like
                            isDense: true, // and add this line
                            hintText: 'Search',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontStyle: FontStyle.normal,
                            )),
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ),
                  InkWell(
                    child: Icon(
                      Icons.mic,
                      color: Colors.grey,
                    ),
                    onTap: () {},
                  )
                ],
              ),
            ),
          ),
        ),
        /*Container(
          color: Colors.white,
          margin: EdgeInsets.symmetric(horizontal: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.search, color: Colors.grey),
              Expanded(
                child: Container(
                  height: 40,
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(
                            10), //Change this value to custom as you like
                        isDense: true, // and add this line
                        hintText: 'Search',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontStyle: FontStyle.normal,
                        )),
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    maxLines: 1,
                  ),
                ),
              ),
              InkWell(
                child: Icon(
                  Icons.mic,
                  color: Colors.grey,
                ),
                onTap: () {},
              )
            ],
          ),
        ),*/
        Container(
          margin: EdgeInsets.symmetric(horizontal: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ButtonTheme(
                minWidth: 120.0,
                height: 30,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.white),
                  ),
                  color: Colors.white,
                  textColor: Colors.black,
                  padding: EdgeInsets.all(4.0),
                  onPressed: () {},
                  child: Text(
                    "Suggestions",
                    style: TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              ButtonTheme(
                minWidth: 120.0,
                height: 30,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.white),
                  ),
                  color: Colors.white,
                  textColor: Colors.black,
                  padding: EdgeInsets.all(4.0),
                  onPressed: () {},
                  child: Text(
                    "All Friends",
                    style: TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: listScreens[tabIndex],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        backgroundColor: Color(0xfff1f1f1),
        appBar: tabIndex == 0
            ? appBar()
            : tabIndex == 2
                ? AppBar(
                    title: Text("Now Profile Header"),
                  )
                : null,
        body: tabIndex == 0
            ? searchBar()
            : tabIndex == 1
                ? SafeArea(
                    child: buttonBar(),
                  )
                : listScreens[tabIndex],
        //body: listScreens[tabIndex],
        floatingActionButton: tabIndex == 0
            ? FloatingActionButton(
                backgroundColor: Color(0xff39CEFD),
                onPressed: () => {
                  print("Click to open post creation page."),
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => Createpost(),
                    ),
                  )
                },
                child: Icon(
                  Icons.message,
                  color: Colors.white,
                ),
              )
            : tabIndex == 2
                ? FloatingActionButton(
                    backgroundColor: Color(0xff39CEFD),
                    onPressed: null,
                    child: Icon(
                      Icons.chat,
                      color: Colors.white,
                    ),
                  )
                : null,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xffffffff),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          currentIndex: tabIndex,
          selectedItemColor: Color(0xff39CEFD),
          unselectedItemColor: Colors.grey,
          iconSize: 20,
          elevation: 3,
          onTap: (int index) {
            setState(() {
              tabIndex = index;
            });
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.article,
              ),
              label: 'Posts',
              backgroundColor: Color(0xff2A2B3F),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Fontawesomefour.user,
              ),
              label: 'Friends',
              backgroundColor: Color(0xff2A2B3F),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Fontawesomefour.chat,
              ),
              label: 'Chat',
              backgroundColor: Color(0xff2A2B3F),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
              ),
              label: 'Settings',
              backgroundColor: Color(0xff2A2B3F),
            )
          ],
        ),
      ),
      onWillPop: () => tabIndex == 0
          ? showDialog<bool>(
              context: context,
              builder: (c) => AlertDialog(
                backgroundColor: Colors.white,
                title: Text(
                  'Warning',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                content: Text(
                  'Do you really want to exit',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                actions: [
                  FlatButton(
                    child: Text(
                      'No',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    onPressed: () => Navigator.pop(c, false),
                  ),
                  FlatButton(
                    child: Text(
                      'Yes',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    onPressed: () => Navigator.pop(c, true),
                  ),
                ],
              ),
            )
          : null,
    );
  }
}

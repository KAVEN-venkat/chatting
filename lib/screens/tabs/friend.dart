import 'package:flutter/material.dart';
import 'package:chatting/models/user_model.dart';
import 'package:chatting/screens/profile.dart';

class Friend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: onlineUsers.length,
      itemBuilder: (context, i) => new Column(
        children: <Widget>[
          new Divider(
            height: 0.1,
          ),
          new ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(onlineUsers[i].imageUrl),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text(
                  onlineUsers[i].fullname,
                  style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
                ),
                new Text(
                  '3hrs',
                  style: TextStyle(
                    fontSize: 11.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            subtitle: Column(
              children: [
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Text(
                          '10 mutual friends',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10.0,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ButtonTheme(
                      minWidth: 80.0,
                      height: 25.0,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          side: BorderSide(
                            color: Color(0xff39CEFD),
                          ),
                        ),
                        onPressed: () {},
                        color: Color(0xff39CEFD),
                        textColor: Colors.white,
                        child: Text(
                          "Confirm",
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    ButtonTheme(
                      minWidth: 80.0,
                      height: 25.0,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          side: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {},
                        color: Colors.white,
                        textColor: Colors.black,
                        child: Text(
                          "Delete",
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            onTap: () {
              print(onlineUsers[i].fullname);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => Profile(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

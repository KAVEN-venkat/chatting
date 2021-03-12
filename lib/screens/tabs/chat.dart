import 'package:flutter/material.dart';
import 'package:chatting/models/user_model.dart';

class Chat extends StatelessWidget {
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
                  onlineUsers[i].fullname,
                  style: TextStyle(
                    fontSize: 11.0,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
            subtitle: Text(
              onlineUsers[i].fullname,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 11.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

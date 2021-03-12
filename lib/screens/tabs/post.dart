import 'package:flutter/material.dart';
import 'package:chatting/fonts/fontawesomefour_icons.dart';
import 'package:chatting/models/post_model.dart';

class Post extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: postLists.length,
      itemBuilder: (context, i) => new Column(
        children: <Widget>[
          new Divider(
            height: 0.6,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    leading: ClipOval(
                      child: Image.network(
                        postLists[i].user.imageUrl,
                        width: 40,
                        height: 40,
                      ),
                    ),
                    title: Text(postLists[i].user.fullname),
                    subtitle: Text(
                      postLists[i].timeAgo,
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                    trailing: Icon(
                      Icons.more_horiz,
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            child: Text(
                              postLists[i].caption,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    /*child: Text(
                      postLists[i].caption,
                      textAlign: TextAlign.justify,
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),*/
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.start,
                    children: [
                      FlatButton(
                        textColor: Colors.grey,
                        onPressed: () {
                          // Perform some action
                        },
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Fontawesomefour.thumbs_up,
                              size: 16,
                            ),
                            SizedBox(width: 5),
                            Text(postLists[i].comments.toString()),
                          ],
                        ),
                      ),
                      FlatButton(
                        textColor: Colors.grey,
                        onPressed: () {
                          // Perform some action
                        },
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.comment,
                              size: 16,
                            ),
                            SizedBox(width: 5),
                            Text(postLists[i].likes.toString()),
                          ],
                        ),
                      ),
                      FlatButton(
                        textColor: Colors.grey,
                        onPressed: () {
                          // Perform some action
                        },
                        child: Row(
                          children: [
                            Icon(
                              Fontawesomefour.export_icon,
                              size: 16,
                            ),
                            SizedBox(width: 5),
                            Text(postLists[i].shares.toString()),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

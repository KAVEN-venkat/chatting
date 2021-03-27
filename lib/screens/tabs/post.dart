import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:chatting/fonts/fontawesomefour_icons.dart';
import 'package:chatting/models/post_model.dart';
import 'package:chatting/services/PostService.dart';

class Post extends StatefulWidget {
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  final dateFormate =
      DateFormat("dd-MM-yyyy").format(DateTime.parse("2019-09-30"));
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return FutureBuilder<PostList>(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Text('Loading....');
          default:
            if (snapshot.hasError)
              //return Text('Error: ${snapshot.error}');
              return Container(
                child: Text('Some error occured'),
              );
            else
              //print(snapshot.data.posts[0].postedBy.firstName);
              //return Text('Result: ${snapshot.data.posts[0].content}');
              return ListView.builder(
                itemCount: snapshot.data.posts.length,
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
                                  'http://42f49452e798.ngrok.io/images/no_image.png',
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                              title: Text(
                                  snapshot.data.posts[i].postedBy.firstName),
                              subtitle: Text(
                                /*DateFormat("dd-MM-yyyy h:m:s").format(
                                    DateTime.parse(
                                        snapshot.data.posts[i].createdAt))*/
                                timeago.format(DateTime.parse(
                                    snapshot.data.posts[i].createdAt)),
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.6)),
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
                                        snapshot.data.posts[i].content,
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          color: Colors.black.withOpacity(0.6),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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
                                      Text(snapshot
                                          .data.posts[i].commentIds.length
                                          .toString()),
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
                                      Text(snapshot.data.posts[i].likeIds.length
                                          .toString()),
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
                                      Text(snapshot.data.posts[i].shareCount
                                          .toString()),
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
      },
      future: PostService().getPosts(),
    );
  }
}

/*class Post extends StatelessWidget {
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
}*/

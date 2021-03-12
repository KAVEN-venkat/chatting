//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:chatting/fonts/fontawesomefour_icons.dart';
import 'package:chatting/models/news_model.dart';

class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: newsData.length,
      itemBuilder: (context, i) => Column(
        children: <Widget>[
          new Divider(
            height: 0.6,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: new Card(
              color: Color(0xffffffff),
              clipBehavior: Clip.antiAlias,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: ClipOval(
                      child: Image.network(newsData[i].pic),
                    ),
                    title: Text(
                      newsData[i].name,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    ),
                    subtitle: Text(
                      '3hrs Ago',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                  Stack(
                      children: newsData[i].type == 'user'
                          ? <Widget>[
                              newsData[i].articleType == 'article'
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 8,
                                      ),
                                      child: new Container(
                                        decoration: new BoxDecoration(
                                          color: Color(0xff94959F)
                                              .withOpacity(0.1),
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                child: Image(
                                                  image: Image.asset(
                                                          'assets/images/post.png')
                                                      .image,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: new Container(
                                                child: new Container(
                                                  decoration: new BoxDecoration(
                                                    color: Color(0xff1C1C29),
                                                    borderRadius:
                                                        new BorderRadius
                                                            .circular(16),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .fromLTRB(
                                                        8.0, 4.0, 8.0, 4.0),
                                                    child: new Text(
                                                      newsData[i].categoryType,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8.0, 4.0, 8.0, 4.0),
                                              child: Text(
                                                "Shares jump 9% on record PC sales",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8.0, 4.0, 8.0, 4.0),
                                              child: Column(
                                                children: <Widget>[
                                                  Text(
                                                    'HP Inc.’s stock initially jumped 9% in extended trading Tuesday after the PC-and-printer giant reported record PC sales amid surging deman…',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12.0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8.0, 0, 8.0, 0),
                                      child: new Container(
                                        child: new Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: <Widget>[
                                            new Container(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  new Container(
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          8.0, 4.0, 8.0, 4.0),
                                                      child: Text(
                                                        "Shares jump 9% on record PC sales",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  new Container(
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          8.0, 4.0, 8.0, 4.0),
                                                      child: Text(
                                                        'HP Inc.’s stock initially jumped 9% in extended trading Tuesday after the PC-and-printer giant reported record PC sales amid surging deman…',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 12.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                            ]
                          : <Widget>[
                              new Container(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    "assets/images/ad.png",
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              new Container(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 130, 18, 0),
                                  child: Text(
                                    'Coronavirus and Healthcare stock trends',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22.0),
                                  ),
                                ),
                              ),
                            ]),
                  ButtonBar(
                    alignment: MainAxisAlignment.start,
                    children: <Widget>[
                      FlatButton(
                        textColor: Colors.white,
                        onPressed: () {
                          print("test");
                        },
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Fontawesomefour.thumbs_up,
                            ),
                            SizedBox(width: 5),
                            Text("32"),
                          ],
                        ),
                      ),
                      FlatButton(
                        textColor: Colors.white,
                        onPressed: () {
                          // Perform some action
                        },
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.comment,
                            ),
                            SizedBox(width: 5),
                            Text("3"),
                          ],
                        ),
                      ),
                      FlatButton(
                        textColor: Colors.white,
                        onPressed: () {
                          // Perform some action
                        },
                        child: Icon(
                          Fontawesomefour.export_icon,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

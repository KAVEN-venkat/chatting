import 'package:flutter/material.dart';
import 'package:chatting/models/user_model.dart';

class Friend extends StatelessWidget {
  final double circleRadius = 50.0;
  final double circleBorderWidth = 4.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    child: Text(
                      "Suggestions",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 190.0,
            child: ListView.builder(
              itemCount: onlineUsers.length,
              itemBuilder: (context, i) {
                return new Card(
                  elevation: 0.0,
                  color: Color(0xfff1f1f1),
                  child: new Container(
                    width: 140.0,
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.topCenter,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: circleRadius / 2.0),
                              child: Container(
                                //replace this Container with your Card
                                width: double.infinity,
                                //height: 200.0,
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.white,
                                              spreadRadius: 3),
                                        ],
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(height: 25),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child:
                                                Text(onlineUsers[i].fullname),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text("12 mutual friends"),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: SizedBox(
                                              width: 120.0,
                                              height: 30.0,
                                              child: ElevatedButton(
                                                child: Text("Add Friend"),
                                                onPressed: () {
                                                  print("Add Friend");
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  primary: Color(0xff39CEFD),
                                                  onPrimary: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            32.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: SizedBox(
                                              width: 90.0,
                                              height: 25.0,
                                              child: ElevatedButton(
                                                child: Text("Remove"),
                                                onPressed: () {
                                                  print("Remove");
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  primary: Colors.white,
                                                  onPrimary: Color(0xff39CEFD),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            32.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 18),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: circleRadius,
                              height: circleRadius,
                              decoration: ShapeDecoration(
                                  shape: CircleBorder(), color: Colors.white),
                              child: Padding(
                                padding: EdgeInsets.all(circleBorderWidth),
                                child: DecoratedBox(
                                  decoration: ShapeDecoration(
                                    shape: CircleBorder(),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        onlineUsers[i].imageUrl,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}

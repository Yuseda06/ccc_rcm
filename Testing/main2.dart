//import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
//import 'Custom_Icons.dart';
//import 'data.dart';
//import 'package:firebase_database/firebase_database.dart';
//
//void main() => runApp(MaterialApp(
//  home: MyApp(),
//  debugShowCheckedModeBanner: false,
//));
//
//class MyApp extends StatefulWidget {
//  @override
//  _MyAppState createState() => _MyAppState();
//}
//
//class _MyAppState extends State<MyApp> {
//  int _currentIndex = 0;
//
//  final FirebaseDatabase database = FirebaseDatabase.instance;
//  String drawerItem;
//
//  DatabaseReference databaseReference;
//  static Map<dynamic, dynamic> data;
//
//  Widget _tableData(int index) {
//
//    return StreamBuilder<Event>(
//        stream: FirebaseDatabase.instance
//            .reference()
//            .child('MISDaily')
//            .child('Current')
//            .child('${queue[index]}')
//            .onValue,
//        builder: (BuildContext context, AsyncSnapshot<Event> event) {
//          data = event.data.snapshot.value;
//
//          return Column(
//            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//            children: <Widget>[
//              Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: <Widget>[
//                  Text(
//                    "Calls Entered",
//                    style: TextStyle(color: Colors.blueGrey),
//                  ),
//                  Text('${data['Entered']}'
//                  ),
//                ],
//              ),
//              SizedBox(
//                height: 15,
//              ),
//              Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: <Widget>[
//                  Text(
//                    "Calls Answered",
//                    style: TextStyle(color: Colors.blueGrey),
//                  ),
//                  Text('${data['Answered']}'),
//                ],
//              ),
//              SizedBox(
//                height: 15,
//              ),
//              Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: <Widget>[
//                  Text(
//                    "Calls Abandoned",
//                    style: TextStyle(color: Colors.blueGrey),
//                  ),
//                  Text('${data['Abandoned'] - data['AbandonedThres']}'),
//                ],
//              ),
//              SizedBox(
//                height: 15,
//              ),
//              Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: <Widget>[
//                  Text(
//                    "ACR%",
//                    style: TextStyle(color: Colors.blueGrey),
//                  ),
//                  Text( '${(double.parse(data['ACR'].toString()) * 100).toStringAsFixed(1)}%'),
//                ],
//              ),
//              SizedBox(
//                height: 15,
//              ),
//              Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: <Widget>[
//                  Text(
//                    "SLA 20",
//                    style: TextStyle(color: Colors.blueGrey),
//                  ),
//                  Text('${(double.parse(data['SLA20'].toString()) * 100).toStringAsFixed(0)}%'),
//                ],
//              ),
//              SizedBox(
//                height: 15,
//              ),
////              Row(
////                mainAxisAlignment: MainAxisAlignment.spaceBetween,
////                children: <Widget>[
////                  Text(
////                    "SLA 45",
////                    style: TextStyle(color: Colors.blueGrey),
////                  ),
////                  Text( '${(double.parse(data['SLA45'].toString()) * 100).toStringAsFixed(0)}%'),
////                ],
////              )
//            ],
//          );
//
//        });
//  }
//
//  Widget _buildGradientContainer(double width, double height) {
//    return Align(
//      alignment: Alignment.topRight,
//      child: Container(
//        width: width * .8,
//        height: height / 2,
//        decoration: BoxDecoration(
//            gradient: LinearGradient(
//                colors: [Color(0xFFfbfcfd), Color(0xFFf2f3f8)],
//                begin: Alignment.topCenter,
//                end: Alignment.bottomCenter,
//                stops: [0.5, 1.0])),
//      ),
//    );
//  }
//
//  Widget _buildAppBar() {
//    return Positioned(
//      top: 40.0,
//      left: 20.0,
//      right: 20.0,
//      child: Row(
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//        children: <Widget>[
//          IconButton(
//            icon: Icon(CustomIcons.menu, color: Colors.black),
//            onPressed: () {},
//          ),
//          Image.asset(
//            "assets/rhb.png",
//            width: 55.0,
//            height: 30.0,
//          ),
//          IconButton(
//            icon: Icon(CustomIcons.search, color: Colors.black),
//            onPressed: () {},
//          )
//        ],
//      ),
//    );
//  }
//
//  Widget _buildTitle(double height) {
//    return Positioned(
//      top: 130,
//      left: 30.0,
//      child: Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
//        children: <Widget>[
//          Text("Daily Performance Review",
//              style:
//              TextStyle(fontSize: 20.0, fontFamily: "Montserrat-Medium")),
//          SizedBox(
//            height: 15,
//          ),
//          Text("Real Time",
//              style: TextStyle(fontSize: 16.0, fontFamily: "Montserrat-Medium"))
//        ],
//      ),
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      backgroundColor: Color(0xFFf2f3f8),
//      body: LayoutBuilder(
//        builder: (context, constraints) {
//          var width = constraints.maxWidth;
//          var height = constraints.maxHeight;
//
//          return Stack(fit: StackFit.expand, children: <Widget>[
//            _buildGradientContainer(width, height),
//            _buildAppBar(),
//            _buildTitle(height),
//            Align(
//              alignment: Alignment.bottomCenter,
//              child: SizedBox(
//                height: height * .6,
//                child: ListView.builder(
//                  itemCount: line.length,
//                  scrollDirection: Axis.horizontal,
//                  physics: BouncingScrollPhysics(),
//                  itemBuilder: (context, index) {
//                    return Padding(
//                      padding: EdgeInsets.only(left: 35.0, bottom: 60.0),
//                      child: SizedBox(
//                        width: 200.0,
//                        child: Stack(
//                          fit: StackFit.expand,
//                          children: <Widget>[
//                            Padding(
//                              padding: EdgeInsets.only(top: 20.0),
//                              child: Container(
//                                decoration: BoxDecoration(
//                                    color: (index % 2 == 0)
//                                        ? Colors.white
//                                        : Colors.white,
//                                    boxShadow: [
//                                      BoxShadow(
//                                          color: Colors.black12,
//                                          offset: Offset(0.0, 10.0),
//                                          blurRadius: 10.0)
//                                    ],
//                                    borderRadius: BorderRadius.circular(12.0)),
//                              ),
//                            ),
//                            Column(
//                              crossAxisAlignment: CrossAxisAlignment.center,
//                              children: <Widget>[
//                                Stack(
//                                  children: <Widget>[
//                                    Padding(
//                                      padding: const EdgeInsets.only(
//                                          right: 5.0, top: 8.0),
//                                      child: Container(
//                                        decoration: BoxDecoration(
//                                            borderRadius:
//                                            BorderRadius.circular(25.0),
//                                            color: Color(0xFF6ccee6)),
//                                        height: 40,
//                                        width: 40,
//                                        child: Icon(
//                                          Icons.call,
//                                          color: Colors.white,
//                                        ),
//                                      ),
//                                    ),
//                                    Padding(
//                                      padding: const EdgeInsets.only(
//                                          left: 30, top: 13.0),
//                                      child: Container(
//                                        decoration: BoxDecoration(
//                                            borderRadius:
//                                            BorderRadius.circular(5.0),
//                                            color: Color(0xFF6ccee6)),
//                                        height: 30,
//                                        width: 120,
//                                        child: Align(
//                                          alignment: Alignment.centerLeft,
//                                          child: Text(
//                                            line[index],
//                                            style: TextStyle(
//                                                fontFamily: "Montserrat-Medium",
//                                                fontSize: 16,
//                                                color: Colors.white),
//                                          ),
//                                        ),
//                                      ),
//                                    ),
//                                  ],
//                                ),
//                                SizedBox(
//                                  height: 12.0,
//                                ),
//                                Padding(
//                                  padding: EdgeInsets.all(12.0),
//                                  child: Padding(
//                                    padding: const EdgeInsets.all(8.0),
//                                    child: _tableData(index),
//                                  ),
//                                )
//                              ],
//                            )
//                          ],
//                        ),
//                      ),
//                    );
//                  },
//                ),
//              ),
//            )
//          ]);
//        },
//      ),
//      bottomNavigationBar: BottomNavigationBar(
//        selectedItemColor: Colors.black,
//        onTap: (index) {
//          setState(() {
//            _currentIndex = index;
//          });
//        },
//        currentIndex: _currentIndex,
//        items: [
//          BottomNavigationBarItem(
//              icon: Icon(Icons.local_phone),
//              title: Container(
//                height: 0.0,
//              )),
//          BottomNavigationBarItem(
//              icon: Icon(Icons.account_balance_wallet),
//              title: Container(
//                height: 0.0,
//              ))
//        ],
//      ),
//      floatingActionButton: Container(
//        width: 55.0,
//        height: 55.0,
//        decoration: BoxDecoration(
//            color: Color(0xFF6ccee6),
//            shape: BoxShape.circle,
//            boxShadow: [
//              BoxShadow(
//                  color: Color(0xFF6ccee6).withOpacity(.6),
//                  offset: Offset(0.0, 10.0),
//                  blurRadius: 10.0)
//            ]),
//        child: RawMaterialButton(
//          shape: CircleBorder(),
//          child: Icon(
//            Icons.home,
//            size: 35.0,
//            color: Colors.white,
//          ),
//          onPressed: () {},
//        ),
//      ),
//      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//    );
//  }
//}

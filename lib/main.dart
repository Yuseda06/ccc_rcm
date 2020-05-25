import 'package:ccc_rcm/screen/BezilChart.dart';
import 'package:ccc_rcm/screen/LineChart.dart';
import 'package:ccc_rcm/screen/LineChartSample1.dart';
import 'package:ccc_rcm/screen/LineChartScreen.dart';
import 'package:ccc_rcm/screen/LineGraph.dart';
import 'package:ccc_rcm/screen/MalaysiaStatus.dart';
import 'package:ccc_rcm/screen/SalesHomePage.dart';
import 'package:ccc_rcm/screen/queueDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'Custom_Icons.dart';
import 'data.dart';
import 'package:flutter/services.dart';
import 'package:firebase_database/firebase_database.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/screen1': (BuildContext context) => new MyApp(),
        '/screen2': (BuildContext context) => new QueueDetails(),
        '/screen3': (BuildContext context) => new MalaysiaStatus(),
        '/screen4': (BuildContext context) => new BezilChart()
      },
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  Color _currentColor = Color(0xFF6ccee6);
  double _acrCurrent = 1.0;
  String _currentDate = "";

  final FirebaseDatabase database = FirebaseDatabase.instance;
  String drawerItem;

  DatabaseReference databaseReference;
  static Map<dynamic, dynamic> data;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
//      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitUp,
    ]);
  }

  Widget _buildGradientContainer(double width, double height) {


    return Align(
      alignment: Alignment.topRight,
      child: Container(
        width: width * .7,
        height: height / 2,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xFFfbfcfd), Color(0xFFf2f3f8)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.5, 1.0])),
      ),
    );
  }

  Widget _buildAppBar() {
    return Positioned(
      top: 40.0,
      left: 20.0,
      right: 20.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(CustomIcons.menu, color: Colors.black),
            onPressed: () {},
          ),
          Image.asset(
            "assets/rhb.png",
            width: 55.0,
            height: 30.0,
          ),
          IconButton(
            icon: Icon(CustomIcons.search, color: Colors.black),
            onPressed: () {},
          )
        ],
      ),
    );
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Alert Dialog title"),
          content: Text(
              ""), //(double.parse(data['ACR'].toString()) * 100).toString()),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildTitle(double height) {
    return Positioned(
      top: 90,
      left: 30.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("Daily Performance Review",
              style:
                  TextStyle(fontSize: 18.0, fontFamily: "Montserrat-Medium")),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget _queueBox(int index) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (BuildContext context) =>
                      QueueDetails(queue: '${queue[index]}', index: index)));
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 0),
          child: Container(
            height: 140,
            width: 120,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0.0, 10.0),
                            blurRadius: 10.0)
                      ],
                      borderRadius: BorderRadius.circular(15.0)),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: StreamBuilder<Event>(
                          stream: FirebaseDatabase.instance
                              .reference()
                              .child('MISDaily')
                              .child('Current')
                              //.child('${}')
                              .onValue,
                          builder: (BuildContext context,
                              AsyncSnapshot<Event> event) {
                            if (!event.hasData)
                              return Center(
                                  child: Image.asset("assets/circle.gif",
                                      width: 50.0, height: 140.0));
                            data = event.data.snapshot.value;

                            _acrCurrent = (double.parse(
                                    data[queue[index]]['ACR'].toString()) *
                                100);
                            _currentDate = data[queue[index]]['Time'];
                            //  print(double.parse(
                            //          data[queue[index]]['ACR'].toString()) *
                            //      100);

                            return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(15.0),
                                          topLeft: Radius.circular(15.0)),
                                      //color: coloring(index, _acrCurrent)),
                                      color: (_acrCurrent < acr[index])
                                          ? Color(0xFF6ccee6)
                                          : Colors.redAccent),
                                  height: 25,
                                  width: 150,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      line[index],
                                      style: TextStyle(
                                          fontFamily: "Montserrat-Medium",
                                          fontSize: 14,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "ACR",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12.0,
                                            fontFamily: "Tribuchet"),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        '${(double.parse(data[queue[index]]['ACR'].toString()) * 100).toStringAsFixed(1)}%',
                                        style: TextStyle(
                                            color: ((double.parse(
                                                            data[queue[index]]
                                                                    ['ACR']
                                                                .toString()) *
                                                        100) <
                                                    acr[index])
                                                ? Colors.black54
                                                : Colors.redAccent,
                                            fontSize: 12.0,
                                            fontFamily: "Montserrat-Medium"),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "SLA 20",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12.0,
                                            fontFamily: "Tribuchet"),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        '${(double.parse(data[queue[index]]['SLA20'].toString()) * 100).toStringAsFixed(0)}%',
                                        style: TextStyle(
                                            color: ((double.parse(
                                                            data[queue[index]]
                                                                    ['SLA20']
                                                                .toString()) *
                                                        100) >
                                                    80)
                                                ? Colors.black54
                                                : Colors.redAccent,
                                            fontSize: 12.0,
                                            fontFamily: "Montserrat-Medium"),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'CALL',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12.0,
                                            fontFamily: "Tribuchet"),
                                        textAlign: TextAlign.left,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            '${data[queue[index]]['Abandoned'] - data[queue[index]]['AbandonedThres']}',
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 12.0,
                                                fontFamily:
                                                    "Montserrat-Medium"),
                                          ),
                                          Text(
                                            '/${data[queue[index]]['Entered'].toString()}',
                                            style: TextStyle(
                                                color: _currentColor,
                                                fontSize: 12.0,
                                                fontFamily:
                                                    "Montserrat-Medium"),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: Center(
                                    child: Text(
                                      '${data[queue[index]]['Time']}',
                                      style: TextStyle(
                                          letterSpacing: 3.0,
                                          color: Colors.black54,
                                          fontSize: 8.0,
                                          fontFamily: "Montserrat-Medium"),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
    }

    return new Scaffold(
      backgroundColor: Color(0xFFf2f3f8),
      body: LayoutBuilder(
        builder: (context, constraints) {
          var width = constraints.maxWidth;
          var height = constraints.maxHeight;

          return Stack(fit: StackFit.expand, children: <Widget>[
            _buildGradientContainer(width, height),
            _buildAppBar(),
            _buildTitle(height),
            Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: height * .85,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          _queueBox(0),
                          _queueBox(1),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          _queueBox(2),
                          _queueBox(3),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          _queueBox(4),
                          _queueBox(5),
                        ],
                      ),
                    ],
                  ),
                )),
          ]);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
//        onTap: (index) {
//          setState(() {
//            _currentIndex = index;
//          });
//        },
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: IconButton(
                iconSize: 30.0,
                icon: Icon(Icons.access_alarms, color: Colors.black54),
                onPressed: () {
                  Navigator.of(context).pushNamed('/screen3');
                },
              ),
              title: Container(
                height: 0.0,
              )),
          BottomNavigationBarItem(
              icon: IconButton(
                iconSize: 30.0,
                icon: Icon(Icons.access_alarms, color: Colors.black54),
                onPressed: () {
                  Navigator.of(context).pushNamed('/screen4');
                },
              ),
              title: Container(
                height: 0.0,
              )),
        ],
      ),
      floatingActionButton: Container(
        width: 55.0,
        height: 55.0,
        decoration: BoxDecoration(
            color: Color(0xFF6ccee6),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  color: Color(0xFF6ccee6).withOpacity(.6),
                  offset: Offset(0.0, 10.0),
                  blurRadius: 10.0)
            ]),
        child: RawMaterialButton(
          shape: CircleBorder(),
          child: Icon(
            Icons.show_chart,
            size: 35.0,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

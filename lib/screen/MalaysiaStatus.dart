import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:ccc_rcm/data.dart';
import 'package:flutter/services.dart';

class MalaysiaStatus extends StatefulWidget {
  @override
  _MalaysiaStatusState createState() => _MalaysiaStatusState();
}

class _MalaysiaStatusState extends State<MalaysiaStatus> {
  final FirebaseDatabase database = FirebaseDatabase.instance;
  String drawerItem;

  DatabaseReference databaseReference;
  static Map<dynamic, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<Event>(
            stream: FirebaseDatabase.instance
                .reference()
                .child('MISDaily')
                .child('Current')
                //.child('${widget.queue}')
                .onValue,
            builder: (BuildContext context, AsyncSnapshot<Event> event) {
              if (!event.hasData)
                return Center(
                    child: Image.asset("assets/circle.gif",
                        width: 50.0, height: 140.0));
              data = event.data.snapshot.value;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                    height: 100,
                    width: double.infinity,
                    child: Column(
                      children: <Widget>[
                        Text(
                          "CCC Performance as of ",
                          style:
                              TextStyle(fontSize: 28.0, color: Colors.black38,),
                        ),
                        Text(
                          '${data['MALAYSIA']['Time'].toString()}',
                          style:
                              TextStyle(fontSize: 14.0, color: Colors.blueGrey, letterSpacing: 5.0),
                        )
                      ],
                    ),
                  ),
                  Divider(thickness: 1.0,),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                    height: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Call Volume",
                          style: TextStyle(
                              fontSize: 20.0, color: Colors.lightBlueAccent),
                        ),
                        Text(""),
                        Text(
                          "Malaysia = " +
                              '${data['MALAYSIA']['Entered'].toString()}',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black45,
                              fontFamily: "Montserrat-Medium"),
                        ),
                        Text(
                          "Mass Segment = " +
                              '${data['MASS SEGMENT']['Entered'].toString()}',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black45,
                              fontFamily: "Montserrat-Medium"),
                        ),
                      ],
                    ),
                  ),
                  Divider(thickness: 1.0,),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                    height: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "ACR",
                          style: TextStyle(
                              fontSize: 20.0, color: Colors.lightBlueAccent),
                        ),
                        Text(""),
                        Text(
                          "Malaysia = " +
                              '${(double.parse(data['MALAYSIA']['ACR'].toString()) * 100).toStringAsFixed(1)}%',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black45,
                              fontFamily: "Montserrat-Medium"),
                        ),
                        Text(
                          "Mass Segment = " +
                              '${(double.parse(data['MASS SEGMENT']['ACR'].toString()) * 100).toStringAsFixed(1)}%',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black45,
                              fontFamily: "Montserrat-Medium"),
                        ),
                      ],
                    ),
                  ),
                  Divider(thickness: 1.0,),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                    height: 180,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Top Calls",
                          style: TextStyle(
                              fontSize: 20.0, color: Colors.lightBlueAccent),
                        ),
                        Text(""),
                        Text(
                          "1) IBK Call Volume = " +
                              '${data['IBK']['Entered'].toString()}',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black45,
                              fontFamily: "Montserrat-Medium"),
                        ),
                        Text(" "),
                        Text(
                          "2) Credit Card Call Volume = " +
                              '${data['CREDIT CARD']['Entered'].toString()}',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black45,
                              fontFamily: "Montserrat-Medium"),
                        ),
                        Text(""),
                        Text(
                          "3) BNM Moratorium Call Volume = " +
                              '${data['LOAN']['Entered'].toString()}',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black45,
                              fontFamily: "Montserrat-Medium"),
                        ),
                        Text(
                          "   - To clarify on SMS received = " +
                              '${(int.parse(data['BNM']['SMSClarify'].toString())*4).toString()}',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black45,
                              fontFamily: "Montserrat-Medium"),
                        ),
                        Text(
                          "   - Custs wrongly replied SMS = " +
                              '${(int.parse(data['BNM']['SMSWrongly'].toString())*4).toString()}',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black45,
                              fontFamily: "Montserrat-Medium"),
                        ),
                      ],
                    ),
                  ),
                  Divider(thickness: 1.0,),
                ],
              );
            }),
      ),
    );
  }
}

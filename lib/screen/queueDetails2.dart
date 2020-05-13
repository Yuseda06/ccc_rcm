import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:ccc_rcm/data.dart';

class QueueDetails extends StatefulWidget {
  final String queue;
  final int index;

  const QueueDetails({Key key, this.queue, this.index}) : super(key: key);

  @override
  _QueueDetailsState createState() => _QueueDetailsState();
}

class _QueueDetailsState extends State<QueueDetails> {
  Color _currentColor = Color(0xFF6ccee6);
  double _acrCurrent = 1.0;

  final FirebaseDatabase database = FirebaseDatabase.instance;
  String drawerItem;

  DatabaseReference databaseReference;
  static Map<dynamic, dynamic> data;

  @override
  void initState() {
    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 0),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
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
                              //.child('${widget.queue}')
                              .onValue,
                          builder: (BuildContext context,
                              AsyncSnapshot<Event> event) {
                            if (!event.hasData)
                              return Center(
                                  child: Image.asset("assets/circle.gif",
                                      width: 50.0, height: 140.0));
                            data = event.data.snapshot.value;

                            _acrCurrent = (double.parse(
                                    data[widget.queue]['ACR'].toString()) *
                                100);
                            print((data[widget.queue]['ACR'].toString()) +
                                "queueDetails");

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
                                      color: (_acrCurrent < acr[widget.index])
                                          ? Color(0xFF6ccee6)
                                          : Colors.redAccent),
                                  height: 25,
                                  width: 150,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      line[widget.index],
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
                                        '${(double.parse(data[widget.queue]['ACR'].toString()) * 100).toStringAsFixed(1)}%',
                                        style: TextStyle(
                                            color: ((double.parse(
                                                            data[widget.queue]
                                                                    ['ACR']
                                                                .toString()) *
                                                        100) <
                                                    acr[widget.index])
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
                                        '${(double.parse(data[widget.queue]['SLA20'].toString()) * 100).toStringAsFixed(0)}%',
                                        style: TextStyle(
                                            color: ((double.parse(
                                                            data[widget.queue]
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
                                            '${data[widget.queue]['Abandoned'] - data[widget.queue]['AbandonedThres']}',
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 12.0,
                                                fontFamily:
                                                    "Montserrat-Medium"),
                                          ),
                                          Text(
                                            '/${data[widget.queue]['Entered'].toString()}',
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
                                      '${data[widget.queue]['Time']}',
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
      ),
    );
  }
}

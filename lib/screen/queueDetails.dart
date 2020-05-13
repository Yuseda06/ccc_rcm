import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:ccc_rcm/data.dart';
import 'package:flutter/services.dart';

class QueueDetails extends StatefulWidget {
  final String queue;
  final int index;

  const QueueDetails({Key key, this.queue, this.index}) : super(key: key);

  @override
  _QueueDetailsState createState() => _QueueDetailsState();
}

class _QueueDetailsState extends State<QueueDetails> {
//  Color _currentColor = Color(0xFF6ccee6);
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
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  StreamBuilder<Event>(
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

                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            ClipPath(
                              clipper: myClipper(),
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        ((_acrCurrent < acr[widget.index])
                                            ? Color(0xFF6ccee6)
                                            : Colors.redAccent),
                                        Colors.lightBlue
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      stops: [0.3, 1.0]),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(20.0)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black12,
                                        offset: Offset(0.0, 5.0),
                                        blurRadius: 10.0)
                                  ],
                                ),
                                height: 60,
                                width: double.infinity,
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.all(12.0),
                                    ),
                                    Text(
                                      line[widget.index],
                                      style: TextStyle(
                                          fontFamily: "Montserrat-Medium",
                                          fontSize: 25,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(25, 20, 0, 0),
                              height: 60,
                              alignment: Alignment.centerLeft,
//                                  color: Colors.black12,
                              child: Text(
                                "Refresh @ " +
                                    '${data[widget.queue]['Time'].toString()}',
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.lightBlue),
                              ),
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width * 0.87,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: ((_acrCurrent < acr[widget.index])
                                            ? Color(0xFF6ccee6).withOpacity(0.1)
                                            : Colors.redAccent.withOpacity(0.1)),
                                        offset: Offset(0.0, 6.0),
                                        blurRadius: 10.0)
                                  ],
                                  color: Colors.white,
                                ),
                                padding: EdgeInsets.all(18),
                                child: Column(
                                  children: <Widget>[
                                    lineStatus(data, 0, widget.queue),
                                    lineStatus(data, 1, widget.queue),
                                    lineStatus(data, 2, widget.queue),
                                    lineStatus(data, 3, widget.queue),
                                    lineStatus(data, 4, widget.queue),
                                    lineStatus(data, 5, widget.queue),
                                    lineStatus(data, 6, widget.queue),
                                    lineStatus(data, 7, widget.queue),
                                    lineStatus(data, 8, widget.queue),
                                  ],
                                )),
                          ],
                        );
                      })
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget lineStatus(Map data, int index, String queue) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          items[index],
          style: TextStyle(
              color: Colors.black38, fontSize: 15.0, fontFamily: "Tribuchet", letterSpacing: 4,),
          textAlign: TextAlign.left,
        ),
        Text(
          (items[index] == "ACR" ||
                  items[index] == "SLA20" ||
                  items[index] == "SLA40")
              ? '${(double.parse(data[queue][items[index]].toString()) * 100).toStringAsFixed(1)}%'
              : '${data[queue][items[index]].toString()}',
          style: TextStyle(
              color: Colors.black54,
              fontSize: 20.0,
              fontFamily: "Montserrat-Medium"),
        ),
      ],
    ),
  );
}

class myClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height - 20);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return null;
  }
}

import 'package:bezier_chart/bezier_chart.dart' as charts;
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class BezilChart extends StatefulWidget {
  @override
  _BezilChartState createState() => _BezilChartState();
}

class _BezilChartState extends State<BezilChart> {
//  @override
//  void initState() {
//    super.initState();
//
//    SystemChrome.setPreferredOrientations([
////      DeviceOrientation.landscapeRight,
//      DeviceOrientation.landscapeLeft,
//    ]);
//  }
//
//  @override
//  dispose() {
//    SystemChrome.setPreferredOrientations([
////      DeviceOrientation.landscapeRight,
////      DeviceOrientation.landscapeLeft,
//      DeviceOrientation.portraitUp,
////      DeviceOrientation.portraitDown,
//    ]);
//    super.dispose();
//  }

  final FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference databaseReference;

  static Map<dynamic, dynamic> data;
  final fromDate = DateTime.now().subtract(Duration(days: 29));
  final toDate = DateTime.now().subtract(Duration(days: 1));

  final date1 = DateTime.now().subtract(Duration(days: 1));
  final date2 = DateTime.now().subtract(Duration(days: 2));

  final double iconSize = 25;
  String formatted;
  DateFormat formatter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<Event>(
            stream: FirebaseDatabase.instance
                .reference()
                .child('MISMTD2020')
                //.child(formatted)
                //.child('${widget.queue}')
                .onValue,
            builder: (BuildContext context, AsyncSnapshot<Event> event) {
              if (!event.hasData)
                return Center(
                    child: Image.asset("assets/circle.gif",
                        width: 50.0, height: 140.0));
              data = event.data.snapshot.value;

              return SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(top: 40),
                          color: Colors.white70,
                          height: .5 * MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: DataTable(
                            columns: [
                              DataColumn(label: Text('RollNo')),
                              DataColumn(label: Text('Current')),
                              DataColumn(
                                  label: Text(
                                      '${formatted = formatter.format(DateTime.now().subtract(Duration(days: 1)))}')),
                              DataColumn(
                                  label: Text(
                                      '${formatted = formatter.format(DateTime.now().subtract(Duration(days: 1)))}')),
                              DataColumn(
                                  label: Text(
                                      '${formatted = formatter.format(DateTime.now().subtract(Duration(days: 1)))}')),
                              DataColumn(
                                  label: Text(
                                      '${formatted = formatter.format(DateTime.now().subtract(Duration(days: 1)))}')),
                              DataColumn(
                                  label: Text(
                                      '${formatted = formatter.format(DateTime.now().subtract(Duration(days: 1)))}')),
                            ],
                            rows: [
                              DataRow(cells: [
                                DataCell(Text('Volume')),
                                DataCell(Text('Arya')),
                                DataCell(Text('6')),
                                DataCell(Text('6')),
                                DataCell(Text('6')),
                                DataCell(Text('6')),
                                DataCell(Text('6')),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('ACR%')),
                                DataCell(Text('John')),
                                DataCell(Text('9')),
                                DataCell(Text('9')),
                                DataCell(Text('9')),
                                DataCell(Text('9')),
                              ]),
                            ],
                          )),
                      Container(
                        color: Colors.white30,
                        height: .5 * MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: charts.BezierChart(
                          fromDate: fromDate,
                          bezierChartScale: charts.BezierChartScale.WEEKLY,
                          toDate: toDate,
                          selectedDate: toDate,
                          series: [
                            charts.BezierLine(
                              lineStrokeWidth: 2,
                              label: "IBK, DCP & Fraud",
                              lineColor: Colors.orangeAccent,
                              onMissingValue: (dateTime) {
                                if (dateTime.day.isEven) {
                                  return 10.0;
                                }
                                return 5.0;
                              },
                              data: generateData('IBK', 'Entered'),
                            ),
                            charts.BezierLine(
                                lineStrokeWidth: 2,
                                lineColor: Colors.lime,
                                label: "Credit Card Matter",
                                onMissingValue: (dateTime) {
                                  if (dateTime.day.isEven) {
                                    return 9.0;
                                  }
                                  return 2.0;
                                },
                                data: generateData('CREDIT_CARD', 'Entered')),
                            charts.BezierLine(
                                lineStrokeWidth: 2,
                                lineColor: Colors.lightBlueAccent,
                                label: "Moratorium",
                                onMissingValue: (dateTime) {
                                  if (dateTime.day.isEven) {
                                    return 9.0;
                                  }
                                  return 2.0;
                                },
                                data: generateData('LOAN', 'Entered')),
                          ],
                          config: charts.BezierChartConfig(
                            verticalIndicatorStrokeWidth: 2.0,
                            verticalIndicatorColor: Colors.black26,
                            showVerticalIndicator: true,
                            pinchZoom: true,
                            verticalIndicatorFixedPosition: false,
                            backgroundColor: Colors.black12,
                            footerHeight: 30.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }

  List<charts.DataPoint<dynamic>> generateData(String queue, String value) {
    List<charts.DataPoint<dynamic>> queueList = [];

    for (int i = 1; i < 30; i++) {
      queueList.add(charts.DataPoint<DateTime>(
          value: data[formatted = formatter
                          .format(DateTime.now().subtract(Duration(days: i)))][
                      '${DateTime.now().subtract(Duration(days: i)).day.toString()}']
                  [queue][value]
              .toDouble(),
          xAxis: DateTime.now().subtract(Duration(days: i))));
    }

    return queueList;
  }
}

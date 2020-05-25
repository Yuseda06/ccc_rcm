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
  String formatted;
  DateFormat formatter;

  @override
  Widget build(BuildContext context) {

    formatter = new DateFormat('MMMM');
    formatted = formatter.format(DateTime.now().subtract(Duration(days: 20)));
    var testin = DateTime.now().subtract(Duration(days: 20)).day.toString();
//    nnnn = DateTime.now().subtract(Duration(days: 19)).day.toString();
    formatted = formatter.format(DateTime.now().subtract(Duration(days: 20)));
    var tessting = DateTime.now().subtract(Duration(days: 20));
print(formatted);
    print(testin);
    print(tessting);
    print(fromDate);
    print(toDate);


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

              return Center(
                child: Container(
                  color: Colors.white30,
                  height: MediaQuery.of(context).size.height/3.4,
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
                        lineColor: Colors.green,
                        onMissingValue: (dateTime) {
                          if (dateTime.day.isEven) {
                            return 10.0;
                          }
                          return 5.0;
                        },
                        data: [
                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 1)))]['${DateTime.now().subtract(Duration(days: 1)).day.toString()}']['IBK']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 1))),
                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 2)))]['${DateTime.now().subtract(Duration(days: 2)).day.toString()}']['IBK']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 2))),
                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 3)))]['${DateTime.now().subtract(Duration(days: 3)).day.toString()}']['IBK']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 3))),
                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 4)))]['${DateTime.now().subtract(Duration(days: 4)).day.toString()}']['IBK']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 4))),
                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 5)))]['${DateTime.now().subtract(Duration(days: 5)).day.toString()}']['IBK']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 5))),
                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 6)))]['${DateTime.now().subtract(Duration(days: 6)).day.toString()}']['IBK']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 6))),
                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 7)))]['${DateTime.now().subtract(Duration(days: 7)).day.toString()}']['IBK']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 7))),
                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 8)))]['${DateTime.now().subtract(Duration(days: 8)).day.toString()}']['IBK']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 8))),
                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 9)))]['${DateTime.now().subtract(Duration(days: 9)).day.toString()}']['IBK']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 9))),
                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 10)))]['${DateTime.now().subtract(Duration(days: 10)).day.toString()}']['IBK']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 10))),
                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 11)))]['${DateTime.now().subtract(Duration(days: 11)).day.toString()}']['IBK']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 11))),
                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 12)))]['${DateTime.now().subtract(Duration(days: 12)).day.toString()}']['IBK']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 12))),
                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 13)))]['${DateTime.now().subtract(Duration(days: 13)).day.toString()}']['IBK']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 13))),
                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 14)))]['${DateTime.now().subtract(Duration(days: 14)).day.toString()}']['IBK']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 14))),
                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 15)))]['${DateTime.now().subtract(Duration(days: 15)).day.toString()}']['IBK']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 15))),
                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 16)))]['${DateTime.now().subtract(Duration(days: 16)).day.toString()}']['IBK']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 16))),
                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 17)))]['${DateTime.now().subtract(Duration(days: 17)).day.toString()}']['IBK']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 17))),
                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 18)))]['${DateTime.now().subtract(Duration(days: 18)).day.toString()}']['IBK']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 18))),
                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 19)))]['${DateTime.now().subtract(Duration(days: 19)).day.toString()}']['IBK']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 19))),
                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 20)))]['${DateTime.now().subtract(Duration(days: 20)).day.toString()}']['IBK']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 20))),
//                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 21)))]['${DateTime.now().subtract(Duration(days: 21)).day.toString()}']['IBK']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 21))),
//                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 22)))]['${DateTime.now().subtract(Duration(days: 22)).day.toString()}']['IBK']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 22))),
//                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 23)))]['${DateTime.now().subtract(Duration(days: 23)).day.toString()}']['IBK']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 23))),
//                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 24)))]['${DateTime.now().subtract(Duration(days: 24)).day.toString()}']['IBK']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 24))),
//                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 25)))]['${DateTime.now().subtract(Duration(days: 25)).day.toString()}']['IBK']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 25))),
//                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 26)))]['${DateTime.now().subtract(Duration(days: 26)).day.toString()}']['IBK']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 26))),
//                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 27)))]['${DateTime.now().subtract(Duration(days: 27)).day.toString()}']['IBK']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 27))),
//                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 28)))]['${DateTime.now().subtract(Duration(days: 28)).day.toString()}']['IBK']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 28))),
//                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 29)))]['${DateTime.now().subtract(Duration(days: 29)).day.toString()}']['IBK']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 29))),
                        ],

                      ),

                      charts.BezierLine(
                        lineStrokeWidth: 2,
                        lineColor: Colors.blueGrey,
                        label: "Credit Card Matter",
                        onMissingValue: (dateTime) {
                          if (dateTime.day.isEven) {
                            return 9.0;
                          }
                          return 2.0;
                        },
                        data: [
                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 1)))]['${DateTime.now().subtract(Duration(days: 1)).day.toString()}']['CREDIT_CARD']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 1))),
                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 2)))]['${DateTime.now().subtract(Duration(days: 2)).day.toString()}']['CREDIT_CARD']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 2))),
                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 3)))]['${DateTime.now().subtract(Duration(days: 3)).day.toString()}']['CREDIT_CARD']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 3))),
                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 4)))]['${DateTime.now().subtract(Duration(days: 4)).day.toString()}']['CREDIT_CARD']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 4))),
                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 5)))]['${DateTime.now().subtract(Duration(days: 5)).day.toString()}']['CREDIT_CARD']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 5))),
                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 6)))]['${DateTime.now().subtract(Duration(days: 6)).day.toString()}']['CREDIT_CARD']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 6))),
                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 7)))]['${DateTime.now().subtract(Duration(days: 7)).day.toString()}']['CREDIT_CARD']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 7))),
                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 8)))]['${DateTime.now().subtract(Duration(days: 8)).day.toString()}']['CREDIT_CARD']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days:8))),
                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 9)))]['${DateTime.now().subtract(Duration(days: 9)).day.toString()}']['CREDIT_CARD']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 9))),
                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 10)))]['${DateTime.now().subtract(Duration(days: 10)).day.toString()}']['CREDIT_CARD']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 10))),
                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 11)))]['${DateTime.now().subtract(Duration(days: 11)).day.toString()}']['CREDIT_CARD']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 11))),
                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 12)))]['${DateTime.now().subtract(Duration(days: 12)).day.toString()}']['CREDIT_CARD']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 12))),
                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 13)))]['${DateTime.now().subtract(Duration(days: 13)).day.toString()}']['CREDIT_CARD']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 13))),
                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 14)))]['${DateTime.now().subtract(Duration(days: 14)).day.toString()}']['CREDIT_CARD']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 14))),
                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 15)))]['${DateTime.now().subtract(Duration(days: 15)).day.toString()}']['CREDIT_CARD']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 15))),
                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 16)))]['${DateTime.now().subtract(Duration(days: 16)).day.toString()}']['CREDIT_CARD']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 16))),
                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 17)))]['${DateTime.now().subtract(Duration(days: 17)).day.toString()}']['CREDIT_CARD']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 17))),
                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 18)))]['${DateTime.now().subtract(Duration(days: 18)).day.toString()}']['CREDIT_CARD']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 18))),
                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 19)))]['${DateTime.now().subtract(Duration(days: 19)).day.toString()}']['CREDIT_CARD']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 19))),
                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 20)))]['${DateTime.now().subtract(Duration(days: 20)).day.toString()}']['CREDIT_CARD']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 20))),
//                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 21)))]['${DateTime.now().subtract(Duration(days: 21)).day.toString()}']['CREDIT_CARD']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 21))),
//                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 22)))]['${DateTime.now().subtract(Duration(days: 22)).day.toString()}']['CREDIT_CARD']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 22))),
//                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 23)))]['${DateTime.now().subtract(Duration(days: 23)).day.toString()}']['CREDIT_CARD']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 23))),
//                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 24)))]['${DateTime.now().subtract(Duration(days: 24)).day.toString()}']['CREDIT_CARD']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 24))),
//                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 25)))]['${DateTime.now().subtract(Duration(days: 25)).day.toString()}']['CREDIT_CARD']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 25))),
//                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 26)))]['${DateTime.now().subtract(Duration(days: 26)).day.toString()}']['CREDIT_CARD']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 26))),
//                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 27)))]['${DateTime.now().subtract(Duration(days: 27)).day.toString()}']['CREDIT_CARD']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 27))),
//                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 28)))]['${DateTime.now().subtract(Duration(days: 28)).day.toString()}']['CREDIT_CARD']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 28))),
//                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 29)))]['${DateTime.now().subtract(Duration(days: 29)).day.toString()}']['CREDIT_CARD']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 29))),
              ],
              ),

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
                        data: [
                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 1)))]['${DateTime.now().subtract(Duration(days: 1)).day.toString()}']['LOAN']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 1))),
                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 2)))]['${DateTime.now().subtract(Duration(days: 2)).day.toString()}']['LOAN']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 2))),
                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 3)))]['${DateTime.now().subtract(Duration(days: 3)).day.toString()}']['LOAN']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 3))),
                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 4)))]['${DateTime.now().subtract(Duration(days: 4)).day.toString()}']['LOAN']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 4))),
                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 5)))]['${DateTime.now().subtract(Duration(days: 5)).day.toString()}']['LOAN']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 5))),
                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 6)))]['${DateTime.now().subtract(Duration(days: 6)).day.toString()}']['LOAN']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 6))),
                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 7)))]['${DateTime.now().subtract(Duration(days: 7)).day.toString()}']['LOAN']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 7))),
                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 8)))]['${DateTime.now().subtract(Duration(days: 8)).day.toString()}']['LOAN']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 8))),
                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 9)))]['${DateTime.now().subtract(Duration(days: 9)).day.toString()}']['LOAN']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 9))),
                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 10)))]['${DateTime.now().subtract(Duration(days: 10)).day.toString()}']['LOAN']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 10))),
                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 11)))]['${DateTime.now().subtract(Duration(days: 11)).day.toString()}']['LOAN']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 11))),
                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 12)))]['${DateTime.now().subtract(Duration(days: 12)).day.toString()}']['LOAN']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 12))),
                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 13)))]['${DateTime.now().subtract(Duration(days: 13)).day.toString()}']['LOAN']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 13))),
                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 14)))]['${DateTime.now().subtract(Duration(days: 14)).day.toString()}']['LOAN']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 14))),
                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 15)))]['${DateTime.now().subtract(Duration(days: 15)).day.toString()}']['LOAN']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 15))),
                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 16)))]['${DateTime.now().subtract(Duration(days: 16)).day.toString()}']['LOAN']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 16))),
                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 17)))]['${DateTime.now().subtract(Duration(days: 17)).day.toString()}']['LOAN']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 17))),
                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 18)))]['${DateTime.now().subtract(Duration(days: 18)).day.toString()}']['LOAN']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 18))),
                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 19)))]['${DateTime.now().subtract(Duration(days: 19)).day.toString()}']['LOAN']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 19))),
                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 20)))]['${DateTime.now().subtract(Duration(days: 20)).day.toString()}']['LOAN']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 20))),
//                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 21)))]['${DateTime.now().subtract(Duration(days: 21)).day.toString()}']['LOAN']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 21))),
//                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 22)))]['${DateTime.now().subtract(Duration(days: 22)).day.toString()}']['LOAN']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 22))),
//                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 23)))]['${DateTime.now().subtract(Duration(days: 23)).day.toString()}']['LOAN']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 23))),
//                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 24)))]['${DateTime.now().subtract(Duration(days: 24)).day.toString()}']['LOAN']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 24))),
//                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 25)))]['${DateTime.now().subtract(Duration(days: 25)).day.toString()}']['LOAN']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 25))),
//                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 26)))]['${DateTime.now().subtract(Duration(days: 26)).day.toString()}']['LOAN']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 26))),
//                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 27)))]['${DateTime.now().subtract(Duration(days: 27)).day.toString()}']['LOAN']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 27))),
//                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 28)))]['${DateTime.now().subtract(Duration(days: 28)).day.toString()}']['LOAN']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 28))),
//                          charts.DataPoint<DateTime>(value: data[formatted = formatter.format(DateTime.now().subtract(Duration(days: 29)))]['${DateTime.now().subtract(Duration(days: 29)).day.toString()}']['LOAN']['Entered'].toDouble(), xAxis: DateTime.now().subtract(Duration(days: 29))),
                       ],
                     ),
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
              );
            }
            )
    );
  }
}

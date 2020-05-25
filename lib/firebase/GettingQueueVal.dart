import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:bezier_chart/bezier_chart.dart' as charts;

class GettingQueueVal extends StatefulWidget {

  final Color color;
  final String segment;
  final String queue;


  @override
  _GettingQueueValState createState() => _GettingQueueValState();

  GettingQueueVal(this.color, this.segment, this.queue);
}

class _GettingQueueValState extends State<GettingQueueVal> {
  final FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference databaseReference;
  static Map<dynamic, dynamic> data;
  final fromDate = DateTime.now().subtract(Duration(days: 30));
  final toDate = DateTime.now();
  final date1 = DateTime.now().subtract(Duration(days: 2));
  final date2 = DateTime.now().subtract(Duration(days: 3));


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Event>(
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

          return Center(
            child: charts.BezierChart(
              series: [
                charts.BezierLine(
                  label: '${widget.segment}',
                  lineColor: widget.color,
                  data: [
                    charts.DataPoint<DateTime>(
                        value: data['${widget.segment}']['${widget.queue}'].toDouble(),
                        xAxis: date1),
                    charts.DataPoint<DateTime>(
                        value: data['${widget.segment}']['${widget.queue}'].toDouble(),
                        xAxis: date2),
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
          );
        });
  }
}
class Sales {
  final int saleVal;
  final String saleYear;
  final String colorVal;
  Sales(this.saleVal,this.saleYear,this.colorVal);

  Sales.fromMap(Map<String, dynamic> map)
      : assert(map['saleVal'] != null),
        assert(map['saleYear'] != null),
        assert(map['colorVal'] != null),
        saleVal = map['saleVal'],
        colorVal = map['colorVal'],
        saleYear=map['saleYear'];

  @override
  String toString() => "Record<$saleVal:$saleYear:$colorVal>";
}
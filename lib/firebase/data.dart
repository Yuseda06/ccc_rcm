//import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
//import 'package:firebase_database/firebase_database.dart';
//
//class FirebaseData extends StatelessWidget {
//
//  FirebaseData({this.queue, this.item});
//
//  final String queue;
//  final String item;
//
//  final FirebaseDatabase database = FirebaseDatabase.instance;
//  DatabaseReference databaseReference;
//  static Map<dynamic, dynamic> data;
//
//  @override
//  Widget build(BuildContext context) {
//    return StreamBuilder<Event>(
//        stream: FirebaseDatabase.instance
//            .reference()
//            .child('MISDaily')
//            .child('Current')
//            .child(queue)
//            .onValue,
//        builder: (BuildContext context, AsyncSnapshot<Event> event) {
//          data = event.data.snapshot.value;
//          print(Text('${data[item]}'));
//          return Text('${data[item]}');
//
//        });
//  }
//}

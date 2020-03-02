import 'dart:async';
import 'package:flutter/material.dart';
import 'event_bus_demo2.dart';
import 'event_util.dart';

class EventBusDemo extends StatefulWidget {
  @override
  _EventBusDemoState createState() => _EventBusDemoState();
}

class _EventBusDemoState extends State<EventBusDemo> {
  StreamSubscription<PageEvent> sss;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          FlatButton(
            onPressed: () {
              sss = EventBusUtil.getInstance().on<PageEvent>().listen((data) {
                print('${data.test}');
                sss.cancel();
              });


              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EventBusDemo2()));
            },
            child: Text('点我进入下一页'),
          ),
        ],
      ),
    );
  }
}



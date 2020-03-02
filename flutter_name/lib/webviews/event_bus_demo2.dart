
import 'package:flutter/material.dart';
import 'event_util.dart';
class EventBusDemo2 extends StatefulWidget {
  @override
  _EventBusDemo2State createState() => _EventBusDemo2State();
}

class _EventBusDemo2State extends State<EventBusDemo2> {
  StreamSubscription<PageEvent> sss;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: FlatButton(
            onPressed: () {
              EventBusUtil.getInstance().fire(PageEvent('我是测试'));
            },
            child: Text('点我网上一页传值'),
          ),
        ));
  }
}

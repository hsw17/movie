import 'package:flutter/material.dart';

class Navigator_Widget extends StatefulWidget {
  @override
  _Navigator_WidgetState createState() => _Navigator_WidgetState();
}

class _Navigator_WidgetState extends State<Navigator_Widget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "Navigator跳转",
        style: TextStyle(color: Colors.indigo, fontSize: 50),
      ),
    );
  }
}

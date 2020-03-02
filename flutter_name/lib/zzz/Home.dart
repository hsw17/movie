import 'package:flutter/material.dart';

import '../zzz/ClipUtils.dart';

void main() => runApp(Clip_Home());

class Clip_Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home_Widget(),
    );
  }
}

class Home_Widget extends StatefulWidget {
  @override
  _Home_WidgetState createState() => _Home_WidgetState();
}

class _Home_WidgetState extends State<Home_Widget> {
  var _currentIndex = 0;
  List<Widget> BottomBarIndex = [Clip(), Clip(), Clip()];

  get drawer => null;

  @override
  Widget build(BuildContext context) {
    //上下文，宽高，允许字体缩放
//    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: this._currentIndex,
        onTap: (int index) {
          setState(() {
            this._currentIndex = index;
          });
        },

        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.home), title: const Text("1")),
          BottomNavigationBarItem(
              icon: const Icon(Icons.wb_cloudy), title: const Text("2")),
          BottomNavigationBarItem(
              icon: const Icon(Icons.settings), title: const Text("3")),
        ],
      ),
      body: IndexedStack(
        index: this._currentIndex,
        children: this.BottomBarIndex,
      ),
    );
  }
}

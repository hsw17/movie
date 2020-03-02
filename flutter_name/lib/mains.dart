import 'package:flutter/material.dart';

import 'homehttp.dart';
import 'homemovie.dart';
import 'mymovie.dart';


void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,

    title: "FloatingActionButton",

    home: HomeActivity(),
  ));

}



class HomeActivity extends StatefulWidget{
  @override
  _HomeActivity createState() => new _HomeActivity();
}

class _HomeActivity extends State<HomeActivity> with SingleTickerProviderStateMixin{
  TabController controller;
  @override
  void initState() {
    controller = new TabController(length: 3, vsync: this);
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: new TabBarView(
          controller: controller,
          children: <Widget>[
            new HomePage(),
            new Cinema(),
            new My_Setting(),
          ],
        ),
        bottomNavigationBar: Material(
          color: Colors.black45,
          child: TabBar(
            controller: controller,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white30,
            tabs: <Widget>[
              new Tab(
                text: "电影",
                icon: new Icon(Icons.movie),
              ),
              new Tab(
                text: "影院",
                icon: new Icon(Icons.album),
              ),
              new Tab(
                text: "我的",
                icon: new Icon(Icons.person),
              ),
            ],
          ),
        )
      ),
    );
  }
}
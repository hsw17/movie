import 'dart:convert';

import 'package:flutter/material.dart';

import '../service.dart';



//购票记录
class Ticket_Record extends StatelessWidget {
  TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: new Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          title: new Text(
            '我的关注',
            textAlign: TextAlign.end,
          ),
          bottom: new TabBar(
            tabs: <Widget>[
              new Tab(
                text: "待付款",
              ),
              new Tab(
                text: "已付款",
              ),
            ],
            controller: _tabController,
          ),
        ),
        body: new TabBarView(
          children: <Widget>[
            Center(
              child: FutureBuilder(
                future: get_Finduserbuyticketrecord_one(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var data = json.decode(snapshot.data.toString());
                    print(data);
                    List<Map> findReleaseMovieList =
                        (data['result'] as List).cast();
                    return Column(
                      children: <Widget>[Text("${findReleaseMovieList}")],
                    );
                  } else {
                    return Center(
                      child: Text('加载中'),
                    );
                  }
                },
              ),
            ),
            Center(
              child: FutureBuilder(
                future: get_Finduserbuyticketrecord_two(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var data = json.decode(snapshot.data.toString());
                    print(data);
                    List<Map> findReleaseMovieList =
                        (data['result'] as List).cast();
                    return Column(
                      children: <Widget>[Text("${findReleaseMovieList}")],
                    );
                  } else {
                    return Center(
                      child: Text('加载中'),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';

import '../service.dart';


//我的关注

class Attention extends StatelessWidget {
  TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: new Scaffold(
        backgroundColor: Colors.black54,
        appBar: new AppBar(
          backgroundColor: Colors.black45,
          centerTitle: true,
          title: new Text(
            '我的关注',
            textAlign: TextAlign.end,
          ),
          bottom: new TabBar(
            tabs: <Widget>[
              new Tab(
                text: "电影",
              ),
              new Tab(
                text: "影院",
              ),
            ],
            controller: _tabController,
          ),
        ),
        body: new TabBarView(
          children: <Widget>[
            Center(
              child: FutureBuilder(

                future: getAttention_Movie(),
                builder: (context, snapshot) {

                  if (snapshot.hasData) {

                    var data = json.decode(snapshot.data.toString());
                    print(data);
                    List<Map> findReleaseMovieList =
                        (data['result'] as List).cast();
                    return Column(

                      children: <Widget>[

                        Attention_Movie(

                          findHotMovieList: findReleaseMovieList,
                        )
                      ],
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
                future: getAttention_Cinema(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var data = json.decode(snapshot.data.toString());
                    print(data);
                    List<Map> findReleaseMovieList =
                        (data['result'] as List).cast();
                    return Column(
                      children: <Widget>[
                        Attention_Cinema(
                          findHotMovieList: findReleaseMovieList,
                        ),
                      ],
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

class Attention_Movie extends StatelessWidget {
  final List findHotMovieList;

  const Attention_Movie({Key key, this.findHotMovieList}) : super(key: key);

  Widget _get(BuildContext context, index) {
    return Container(
      color: Colors.black54,
      padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
      child: Stack(
        children: <Widget>[
          Row(
            children: <Widget>[
              new Center(
                child: new FadeInImage.assetNetwork(
                  placeholder: "images/jc.jpg",
                  image: "${findHotMovieList[index]['imageUrl']}",
                  width: 200,
                  height: 200,
                ),
              ),
              new Column(
                children: <Widget>[
                  new Text("${findHotMovieList[index]["name"]}".trim(),
                      style: new TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center),
                  Row(
                    children: <Widget>[
                      new Text(
                        "导演：",
                        textAlign: TextAlign.left,
                      ),
                      new Text(
                        "${findHotMovieList[index]["director"]}",
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      new Text(
                        "主演：",
                        textAlign: TextAlign.left,
                      ),
                      new Text(
                        "${findHotMovieList[index]["starring"]}",
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      new Text(
                        "评分：",
                        textAlign: TextAlign.left,
                      ),
                      new Text(
                        "${findHotMovieList[index]["score"]}",
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 900,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return _get(context, index);
        },
        itemCount: findHotMovieList.length,
      ),
    );
  }
}

class Attention_Cinema extends StatelessWidget {
  final List findHotMovieList;

  const Attention_Cinema({Key key, this.findHotMovieList}) : super(key: key);

  Widget _get(BuildContext context, index) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
      child: Stack(
        children: <Widget>[
          Row(
            children: <Widget>[
              new Center(
                child: new FadeInImage.assetNetwork(
                  placeholder: "images/jc.jpg",
                  image: "${findHotMovieList[index]['logo']}",
                  width: 200,
                  height: 200,
                ),
              ),
              new Column(
                children: <Widget>[
                  new Text("${findHotMovieList[index]["name"]}".trim(),
                      style: new TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center),
                  Row(
                    children: <Widget>[
                      new Text(
                        "${findHotMovieList[index]["address"]}",
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 900,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return _get(context, index);
        },
        itemCount: findHotMovieList.length,
      ),
    );
  }
}

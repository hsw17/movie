import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as client;

import 'dart:convert'; //使用 json 解析
import 'api/apiservice.dart';
import 'bean/remenmovie_entity.dart';//解码和编码JSON

class Cinema extends StatefulWidget {
  @override
  _CinemaState createState() => _CinemaState();
}

class _CinemaState extends State<Cinema> {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(

      length: 3,
      child: Scaffold(
        backgroundColor: Colors.black54,
        appBar: AppBar(
          backgroundColor: Colors.black54,
          title: Row(

            children: <Widget>[

              Expanded(

                child: TabBar(

                  ///TabBar布局
                  tabs: <Widget>[
                    Tab(text: "推荐影院"),
                    Tab(text: "附近影院"),
                    Tab(text: "海淀区"),
                  ],
                ),
              )
            ],
          ),

          ///设置标题居中
          centerTitle: true,
        ),
        body: Tabs(),
      ),
    );
    return Column(
      children: <Widget>[],
    );
  }
}

class Tabs extends StatefulWidget {
  @override
  TabsWidget createState() => TabsWidget();
}
class TabsWidget extends State<Tabs> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new TabBarView(

      children: <Widget>[

        _movie_Cinema(),
        _nearby_cinema(),
        _region_cinema(),
      ],
    );
  }
}

//推荐影院
class _movie_Cinema extends StatefulWidget {
  @override
  _movie_CinemaWidget createState() => _movie_CinemaWidget();
}

class _movie_CinemaWidget extends State<_movie_Cinema> {
  List list;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // get_Data();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
         FutureBuilder(

          future: get_TuiJian(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              var data=json.decode(snapshot.data.toString());
              data=data["result"];
              list = data;
              return ListView(
                children: _getItem(),
              );
            }else{
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        );


   /* return ListView(
      children: _getItem(),
    );*/
  }

  List<Widget> _getItem() {
    return list.map((item) {
      return new Card(
        color: Colors.black45,
        child: new Padding(

          padding: const EdgeInsets.all(2.0),
          child: _item(item),
        ),
        elevation: 3.0,
      //  margin: const EdgeInsets.all(10.0),
      );
    }).toList();
  }

  Widget _item(item) {
    return new Row(

      children: <Widget>[

        new Center(

          child: new FadeInImage.assetNetwork(

            placeholder: "images/jc.jpg",
            image: "${item['logo']}",
            width: 80.0,
            height: 80.0,
          ),
        ),
        new Column(

          mainAxisAlignment: MainAxisAlignment.start,

          children: <Widget>[

            new Text("${item["name"]}".trim(),

                style: new TextStyle(

                  color: Colors.white,
                  fontSize: 10.0,
                ),
                textAlign: TextAlign.start),
            new Text(
              "${item["address"]}",
              //显示行数
              maxLines: 2,
              style: new TextStyle(

                color: Colors.white,
                fontSize: 12.0,
              ),
              //文字溢出
              overflow: TextOverflow.clip,
              //文字大小
              textScaleFactor: 1.0,
            )
          ],
        ),
      ],
    );
  }
}
//附近影院
class _nearby_cinema extends StatefulWidget {
  @override
  _nearby_cinemawidget createState() => _nearby_cinemawidget();
}

class _nearby_cinemawidget extends State<_nearby_cinema> {
  List list;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // get_Data();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      FutureBuilder(
        future: get_FuJin(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var data=json.decode(snapshot.data.toString());
            data=data["result"];
            list = data;
            return ListView(
              children: _getItem(),
            );
          }else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );


    /*ListView(
      children: _getItem(),
    );*/
  }

  List<Widget> _getItem() {
    return list.map((item) {
      return new Card(
        color: Colors.black45,
        child: new Padding(
          padding: const EdgeInsets.all(3.0),
          child: _item(item),
        ),
        elevation: 3.0,
      //  margin: const EdgeInsets.all(10.0),
      );
    }).toList();
  }

  Widget _item(item) {
    return new Row(
      children: <Widget>[
        new Center(
          child: new FadeInImage.assetNetwork(
            placeholder: "images/jc.jpg",
            image: "${item['logo']}",
            width: 80.0,
            height: 80.0,
          ),
        ),
        new Column(
          mainAxisAlignment: MainAxisAlignment.start,

          children: <Widget>[

            Text("${item["name"]}".trim(),
                style: new TextStyle(
                  color: Colors.white,
                  fontSize: 10.0,

                ),
                textAlign: TextAlign.right),
             Text(
              "${item["address"]}",
               style: new TextStyle(

                 color: Colors.white,
                 fontSize: 12.0,
               ),
               //显示行数
               maxLines: 2,
               //文字溢出
               overflow: TextOverflow.ellipsis,
               //文字大小
               textScaleFactor: 1.0,
            )
          ],
        ),
      ],
    );
  }
}

//查询区域ID 海淀区
class _region_cinema extends StatefulWidget {
  @override
  _region_cinemawidget createState() => _region_cinemawidget();
}

class _region_cinemawidget extends State<_region_cinema> {
  List list;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //get_Data();
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      FutureBuilder(
        future: get_HaiDianQu(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var data=json.decode(snapshot.data.toString());
            data=data["result"];
            list = data;
            return ListView(
              children: _getItem(),
            );
          }else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );


  }

  List<Widget> _getItem() {
    return list.map((item) {
      return new Card(
        color: Colors.black45,
        child: new Padding(
          padding: const EdgeInsets.all(10.0),
          child: _item(item),
        ),
        elevation: 3.0,
       // margin: const EdgeInsets.all(10.0),
      );
    }).toList();
  }

  Widget _item(item) {
    return new Stack(

      children: <Widget>[
        new Column(

          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[

            new Text("${item["regionName"]}".trim(),

                style: new TextStyle(

                  color: Colors.white,
                  fontSize: 14.0,
                ),
                textAlign: TextAlign.left),
          ],
        ),
      ],
    );
  }
}


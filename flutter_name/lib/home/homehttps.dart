
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_name/api/apiservice.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:http/http.dart' as client;
import 'dart:convert'; //使用 json 解析

import 'package:dio/dio.dart';

class MyHomeList extends StatefulWidget {

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MyHomeList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            coming_soon_Widget(),
          ],
        ),
      ),
    );
  }
}


//即将上映
class coming_soon_Widget extends StatefulWidget {
  @override
  _coming_State createState() => _coming_State();
}

class _coming_State extends State<coming_soon_Widget> {
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
    return Flexible(
      fit: FlexFit.tight,
        child: FutureBuilder(
          future: get_Data2(),
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
        ),

      /*child: ListView(
        children: _getItem(),
      ),*/
    );
  }

  List<Widget> _getItem() {
    return list.map((item) {
      return new Card(
        child: new Padding(
          padding: const EdgeInsets.all(10.0),
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
            image: "${item['imageUrl']}",
            width: 120.0,
            height: 120.0,
          ),
        ),
        new Column(
          children: <Widget>[
            new Text("${item["name"]}".trim(),
                /* style: new TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),*/
                textAlign: TextAlign.left),
            new Text(
              "${item["wantSeeNum"]}",
            )

          ],
        ),
      ],
    );
  }
}
